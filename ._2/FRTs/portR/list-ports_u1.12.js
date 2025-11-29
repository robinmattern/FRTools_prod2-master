// list-ports.js                                                                        // .(51114.02.3 CAI Write list-ports.js])
import { execSync } from 'child_process';
import { platform } from 'os';

  var filters =  process.argv.slice(2).map(s => s.toLowerCase());
      filters =  filters.filter( a => a ) // Remove blanl rows 
  var filters = `${ filters.length > 0 ? `^${ filters.join('|^') }` : '' }`
//var filters = `^code|^mysql`

//    console.log( `Filtering by: ${ filters.length > 0 ? filters : '' }` ); // process.exit() 

const isWin = platform() === 'win32';

function getNetstat() {
  try {
    return execSync(
      isWin
        ? 'netstat -ano'
        : 'lsof -i -P -n | grep LISTEN',
      { encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] }
    );
  } catch {
    return '';
  }
}

const raw = getNetstat();
if (!raw.trim()) {
  console.log('No listening ports found (netstat/lsof returned nothing).');
  process.exit(0);
}

const entries = [];

if (isWin) {
  // Windows line:  TCP    0.0.0.0:50200   0.0.0.0:0   LISTENING   12345
  raw.split(/\r?\n/).forEach(line => {
    const m = line.match(/^\s*TCP\s+([^:]+):(\d+)\s+[^ ]+\s+LISTENING\s+(\d+)$/);
    if (m) {
      const IP   = m[1];
      const port = m[2];
      const pid  = m[3];
      const proc = getProcessNameWin(pid);
      entries.push({ IP, port, pid, proc });
    }
  });
} else {
  // macOS / Linux line: node  12345 user  ...  TCP *:8080 (LISTEN)
  raw.split('\n').forEach(line => {
    const m = line.match(/^(\S+)\s+(\d+)\s+[^:]*([^:]+):(\d+)\s+\(LISTEN\)/);
    if (m) {
      const proc = m[1];
      const pid  = m[2];
      const IP   = m[3] === '*' ? '0.0.0.0' : m[3];
      const port = m[4];
      entries.push({ IP, port, pid, proc });
    }
  });
}

if (entries.length === 0) {
  console.log('No listening ports found (parsing failed).');
} else {
    console.log(`\n Listening ports ${ filters.length ? `for ${ filters }` : "" }` ); var i=0 
    console.log( `   No. PID            IPAddr:Port   Program` )
    console.log( `  ---- ----- ---------------:-----  -------------------` )

  entries
    .sort((a, b) => +a.port - +b.port)
    .filter( e => { 
      return e.proc.toLowerCase().match( filters ) != null || filters.length == 0 } ) 
//  .forEach(e => console.log( `  ${ `${ ++i }`.padStart(2) }. ${e.IP.padStart(15)}:${ `${e.port}`.padEnd(5) }  →  ${e.proc} (PID ${e.pid})` ) )
    .forEach(e => console.log( `   ${ `${ ++i }`.padStart(2) }. ${ `${e.pid}`.padEnd(5) } ${e.IP.padStart(15)}:${ `${e.port}`.padEnd(5) }  ${e.proc}` ) )
}

// ---------- Windows helper ----------
function getProcessNameWin(pid) {
  try {
    const out = execSync(`tasklist /FI "PID eq ${pid}" /FO CSV`, { encoding: 'utf8' });
    const line = out.split('\r\n')[1];
    if (line) {
      const name = line.split('","')[0].replace(/^"/, '');
      return name;
    }
  } catch {}
  return 'unknown';
}