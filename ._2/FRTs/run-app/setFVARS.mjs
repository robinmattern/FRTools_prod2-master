 import { existsSync, readFileSync, readdirSync, mkdirSync, writeFileSync } from 'fs';
 import   path   from 'path';
//mport   dotenv from 'dotenv';

      var bVSCode  = 1
      if (bVSCode == 1) { process.argv[2] = "a01" 
                          process.argv[3] = "-d" 
//                        process.argv[4] = "a01" 
          }
  
// Parse flags and remove them from arguments
      var bQuiet = 0, bDebug = 0, bDoit = 0;
    const args = [];
   for (var arg of process.argv.slice(2)) {
  if (/^-[qdb]+$/.test(arg)) {
        if (arg.includes('q')) bQuiet = 1;
        if (arg.includes('d')) bDoit  = 1;
        if (arg.includes('b')) bDebug = 1;
 } else if (arg === '-quiet')  bQuiet = 1;
   else if (arg === '-doit' )  bDoit  = 1;
   else if (arg === '-debug')  bDebug = 1;
   else     args.push(arg);
     }
  process.argv = ['node', process.argv[1], ...args];

// console.log( `   bQuiet: '${bQuiet}', bDoit: '${bDoit}', bDebug: '${bDebug}', aArgs: ${ process.argv.slice(2).join(' ') }` ) 

// Collect app arguments matching pattern [asc][0-9]{2} and remove them
let aApps = '';
const filteredArgs = [];
for (const arg of process.argv.slice(2)) {
  if (/^[asc][0-9]{2}$/.test(arg)) {
    aApps += (aApps ? ',' : '') + arg;
  } else {
    filteredArgs.push(arg);
  }
}
process.argv = ['node', process.argv[1], ...filteredArgs];

//const   CONFIG_FILE = '_config_u1.00.yaml'
//const   CONFIG_FILE = '_config_u1.11.yaml'
//const   CONFIG_FILE = '_config_u1.12.yaml'
//const   CONFIG_FILE = '_config_u1.14.yaml'
//const   CONFIG_FILE = '_config_u1.21.yaml'
//const   CONFIG_FILE = '_config_u1.22.yaml'
//const   CONFIG_FILE = '_config_u1.23.yaml'
    var   CONFIG_FILE = '_config.yaml'

      if (process.argv.length === 3 && process.argv[2] !== "") { CONFIG_FILE = process.argv[2] } 

//        console.log(`  aApps: '${aApps}', CONFIG_FILE: '${CONFIG_FILE}'` );
//    var bQuiet   = 1; 
      var BE_QUIET = bQuiet; 
 
//   if (!aApps) { console.log( "x You must enter one or more apps to set _config.js files for." ); process.exit()  } 

// -------------------------------------------------------------------------------------------------------------------------

// Find project root by looking for _config.yaml
function findProjectRoot( ) {
      let currentDir   = process.cwd();
   while (currentDir !== path.parse(currentDir).root) {
      if (existsSync    (path.join( currentDir, CONFIG_FILE))) {
   return currentDir; }
          currentDir   = path.dirname(currentDir);
      }
   return process.cwd();
   }
// ---------------------------------------------------------------------------------

// Initialize FVARS
export function initFVARS( aApp ) {
          BE_QUIET              =  bQuiet ? bQuiet : 0;

      var ROOT_DIR              =  findProjectRoot();
      var pFVARS                =  parseFVARS( ROOT_DIR, aApp ), fvars = pFVARS;  pFVARS = {} 
//    var aAppDir               =  path.dirname( process.argv[1] || process.cwd() );
//    var aServerAppDir         =  path.join( ROOT_DIR, 'server', "s03_register-cors-api" );
      var aClientAppDir         =  getAppDir(  ROOT_DIR, `c${aApp.slice(1,3)}` );
      var aServerAppDir         =  getAppDir(  ROOT_DIR, `s${aApp.slice(1,3)}` );
      var aClientPort           =  getPort(    aApp, fvars );
      var aServerPort           = `${aClientPort * 1 + 50}` 
  
       // Parse FVARS from config
//        fvars.CLIENT_PORT     =  fixPort( fvars, 'CLIENT_PORT', aClientPort, 'CLIENT_HOST'    ) 
                                   fixPort( fvars, 'CLIENT_PORT', aClientPort, 'CLIENT_HOST'    ) 

      var aServerPort           =  fvars.CLIENT_PORT ? `${fvars.CLIENT_PORT * 1 + 50}` : aServerPort
//        fvars.SERVER_PORT     =  fixPort( fvars, 'SERVER_PORT', aServerPort, 'SERVER_API_URL' )
                                   fixPort( fvars, 'SERVER_PORT', aServerPort, 'SERVER_API_URL' )
          fvars.DATA_PATH       =  getDataFolder( ROOT_DIR, fvars );
          fvars.SERVER_ENV_FILE =  chkEnvFile( ROOT_DIR, aServerAppDir )

          pFVARS.PROJECT_NO     =  fvars.PROJECT_NO
          pFVARS.PROJECT_NAME   =  fvars.PROJECT_NAME
          pFVARS.PROJECT_VERSION=  fvars.PROJECT_VERSION
          pFVARS.PROJECT_STAGE  =  fvars.PROJECT_STAGE
          pFVARS.ROOT_DIR       =  ROOT_DIR;
          pFVARS.DATA_PATH      =  fvars.DATA_PATH 
          pFVARS.CLIENT_APP_DIR =  aClientAppDir
          pFVARS.SERVER_APP_DIR =  aServerAppDir

      var nApp = aApp.slice(1,3);  
          pFVARS[ `S${nApp}_DATA_PATH`      ] =  fvars.DATA_PATH;
          pFVARS[ `S${nApp}_SERVER_ENV_FILE`] =  fvars.SERVER_ENV_FILE;
          pFVARS[ `S${nApp}_CLIENT_PORT`    ] = (fvars.CLIENT_PORT    || aClientPort) + '';
          pFVARS[ `S${nApp}_SERVER_PORT`    ] = (fvars.SERVER_PORT    || aServerPort) + '';
      var                  aClient_Host       =  `http://localhost:${ pFVARS[ `S${nApp}_CLIENT_PORT` ] }` 
      var                  aServer_API_URL    =  `http://localhost:${ pFVARS[ `S${nApp}_SERVER_PORT` ] }/api`; 
          pFVARS[ `S${nApp}_CLIENT_HOST`    ] =  fvars.CLIENT_HOST    || aClient_Host;
          pFVARS[ `S${nApp}_SERVER_API_URL` ] =  fvars.SERVER_API_URL || aServer_API_URL;
          pFVARS[ `S${nApp}_CORS_ORIGINS`   ] =  '';

          pFVARS[ `C${nApp}_CLIENT_PORT`    ] = (fvars.CLIENT_PORT    || aClientPort) + '';
          pFVARS[ `C${nApp}_CLIENT_HOST`    ] =  fvars.CLIENT_HOST    || aClient_Host;
          pFVARS[ `C${nApp}_SERVER_PORT`    ] = (fvars.SERVER_PORT    || aServerPort) + '';                 // .(51118.01.1)
          pFVARS[ `C${nApp}_SERVER_API_URL` ] =  fvars.SERVER_API_URL || aServer_API_URL;                   // .(51118.01.2)

      var mOrigins              = (fixHosts( fvars.CORS_ORIGINS, aClientPort ) || aClient_Host ).split(",").map(s => s.trim());
          mOrigins.forEach( aHost => { if (aHost.match( /localhost/ ) ) { mOrigins.push( aHost.replace( /localhost/, "127.0.0.1" ) ) } } )

          pFVARS[ `S${nApp}_CORS_ORIGINS`   ] = `[ '${mOrigins.join( "', '" )}' ]`  

      Object.entries(fvars).forEach( ( [aKey, aValue ] ) => { aKey = aKey.toUpperCase() 
      if (aKey.match( /^[AC][0-9#]{2}_/ )) { pFVARS[ `C${aKey.slice(1)}` ] = aValue 
           if (aKey.slice(1,3) != nApp)    { fixPort2( pFVARS, `C${aKey.slice(1)}`, aClientPort ) }
                                             }
      if (aKey.match( /^[AS][0-9#]{2}_/ )) { pFVARS[ `S${aKey.slice(1)}` ] = aValue 
           if (aKey.slice(1,3) != nApp)    { fixPort2( pFVARS, `S${aKey.slice(1)}`, aServerPort ) }
                                             }
          })
          console_log(   `  FVARS:`, fmtFVARS( JSON.stringify( pFVARS, "", 2 ).split("\n"), 24 ).join("\n  ") )
          pFVARS[ `S${nApp}_CORS_ORIGINS`   ] =  mOrigins

          process.FVARS         =  pFVARS;
     }
// ---------------------------------------------------------------------------------

function getAppDir( aRootDir, aApp ) {
//  const fs    = require('fs');
//  const path  = require('path');
    
      let aFolder = aApp.toLowerCase().startsWith('c') ? 'client' : 'server';
    const digit   = aApp.slice(1, 2);
      if (digit >= '1' && digit <= '9') { aFolder += digit; }
    
    const folderPath = path.join(aRootDir, aFolder);
     if (!existsSync(folderPath)) {
          console_log(`x No ${aFolder} folder exists.` );
   return null;
          }
    
    const dirs = readdirSync( folderPath, { withFileTypes: true } )
         .filter(dirent => dirent.isDirectory())
         .map(dirent => dirent.name);
    
    const found   = dirs.find(dir => dir.toLowerCase().startsWith(aApp.toLowerCase() + '_'));
    
     if (!found) {
          console_log(`x No App folder found that begins with ${aApp}`);
   return null;
          }
    return path.join( folderPath, found );
   }
// ---------------------------------------------------------------------------------

function getPort( aApp, fvars ) {
     var  nStg                   = 'ptd'.indexOf(fvars.PROJECT_STAGE.slice(0,1)) + 1
          aApp                   = (aApp ? aApp : 'a00').toLowerCase(); 
          aApp                   =  aApp.slice(0,1).match(/acs/) ? aApp : 'a' + aApp.slice(1,3);
      var nApp                   =  isNaN( aApp.slice(1) || 'a') ? '00' : aApp.slice(1).padEnd(2,'0');
      var aClientPort            = `${fvars.PROJECT_NO}${nStg}${nApp}`
   return aClientPort 
   }
// ---------------------------------------------------------------------------------
    
function fixPort( fvars, aFvPortVar, aApPort, aFvHostVar ) {
//    if (aFvPort.slice(0,2) == "##" ) { aFvPort = `${aApPort.slice(0,2)}${aFvPort.slice(2, 3)}`  }
//    if (aFvPort.slice(2,1) == "#"  ) { aFvPort = `${aFvPort.slice(0,2)}${aApPort.slice(3, 1)}${aApPort.slice(4, 2)}`   }
//    if (aFvPort.slice(0,2) == "##" ) { aFvPort = `${aFvPort.slice(0,3)}${aApPort.slice(4, 2)}`  }
      var aFvPort =  fvars[aFvPortVar]; var aFvHost = fvars[aFvHostVar] || ''  
     if (!aFvPort) { var m = aFvHost.match( /:([#0-9]+)\/*/ ); aFvPort = m ? m[1] : "#####" 
      if (aFvPort.length != 5) { console_log(`! Invalid port format for ${aFvPort} for ${aFvHostVar}. Shouild be 5 digits.`) }  
          }     
      var aPort   =  fixPort1( aFvPort, aApPort )
      if (aFvHost) { fvars[ aFvHostVar ] = aFvHost.replace(/:[#0-9]+/, `:${aPort}`); } 
                     fvars[ aFvPortVar ] = aPort 
      return aPort 
      }
// ---------------------------------------------------------------------------------

function fixPort1( aFvPort, aApPort ) { aFvPort = aFvPort || '' 
      var nPrj = (aFvPort.slice(0,2) == "##") ? aApPort.slice(0,2) : aFvPort.slice(0,2)  
      var nStg = (aFvPort.slice(2,3) == "#" ) ? aApPort.slice(2,3) : aFvPort.slice(2,3)  
      var nCS  = (aFvPort.slice(3,4) == "#" ) ? aApPort.slice(3,4) : aFvPort.slice(3,4)  
      var nApp = (aFvPort.slice(4,5) == "#" ) ? aApPort.slice(4,5) : aFvPort.slice(4,5)  
      var aPort = `${nPrj}${nStg}${nCS}${nApp}`
      return aPort
      }
// ---------------------------------------------------------------------------------

function fixPort2( fvars, aFvHostVar, aApPort ) {  var aFvHostVar1 = '', aFvPortVar = aFvHostVar 
      if (aFvHostVar.match(/CLIENT_HOST/   )) {    var aFvPortVar   = `${aFvHostVar.slice(0,3)}_CLIENT_PORT`    
                                                fvars[ aFvHostVar ] =  fvars[ aFvHostVar ].replace( /:[#0-9]+/, parse( fvars[ aFvHostVar ], /:[#0-9]+/ ) ) } 

      if (aFvPortVar.match(/CLIENT_PORT/   )) {        aFvHostVar1  = `${aFvHostVar.slice(0,3)}_CLIENT_HOST`        
                                                fvars[ aFvPortVar ] =  parse( fvars[ aFvHostVar1 ], /:([#0-9]+)/ ) }  

      if (aFvHostVar.match(/SERVER_API_URL/)) {        aFvPortVar   = `${aFvHostVar.slice(0,3)}_SERVER_PORT`    
                                                fvars[ aFvPortVar ] =  fvars[ aFvHostVar ].replace( /:[#0-9]+/, parse( fvars[ aFvHostVar ], /:[#0-9]+/ ) ) } 
      if (aFvPortVar.match(/SERVER_PORT/   )) {        aFvHostVar1  = `${aFvPortVar.slice(0,3)}_SERVER_API_URL`     
                                                fvars[ aFvPortVar ] =  parse( fvars[ aFvHostVar1 ], /:([#0-9]+)/ ) }  
      if (aFvHostVar1) { 
          console_log( `\n-- fixPort( ${aFvPortVar}: ${fvars[ aFvPortVar ]}, ${aFvHostVar1}: ${fvars[ aFvHostVar1 ]}, ${aApPort} )` )
                             fixPort( fvars, aFvPortVar, aApPort, aFvHostVar1 ) 
          console_log(   `-- fixPort( ${aFvPortVar}: ${fvars[ aFvPortVar ]}, ${aFvHostVar1}: ${fvars[ aFvHostVar1 ]} )` )
          } 

function parse( aStr, rMatch) { var m = aStr.match( rMatch ); return m ? (m[1] ? m[1] : m[0]) : "" }       
      }
// ---------------------------------------------------------------------------------

function fixHosts( mFvHosts, aApPort ) {
    if (!mFvHosts) { return mFvHosts }
     if (typeof(   mFvHosts ) == "string") {
     var mHosts  = mFvHosts.split(",").map(s => s.trim()) } else { mHosts = mFvHosts }
         mHosts  = mHosts.map( aHost => fixHost( aHost, aApPort ) )
return  (typeof(   mFvHosts ) == "string") ? mHosts.join(", ") : mHosts 

function fixHost(  aFvHost, aApPort ) {
      var aPort  = aFvHost.match( /:([#0-9]+)/ ); aPort = aPort ? aPort[1] : "" 
      if (aPort.match( /#/) ) { 
          aPort  = fixPort1( aPort, aApPort )
          aFvHost= aFvHost.replace( /:[#0-9]+/, `:${aPort}` )
          }
   return aFvHost 
          }
      }
// ---------------------------------------------------------------------------------

function chkEnvFile( aRootDir, aServerAppDir ) {        // Load .env file from server app folder
      var aEnvFile              =  path.join( aServerAppDir, '.env' );
      if (existsSync( aEnvFile )) {
//        dotenv.config({ path: aEnvFile });
          console_log(`= Found .env file: '${aEnvFile}'`);
      } else {
          console_log(`! No .env file found in app folder, '${aEnvFile}'`);
          console_log('  Using environment variables.');
          aEnvFile              =  path.join( aRootDir, '.env' );
          }
   return aEnvFile 
   }        
// ---------------------------------------------------------------------------------

// Read DATA_FOLDER from _config.yaml
function getDataFolder( aRootDir, pFVARS ) {
     var aDataFolder   = path.join( aRootDir, './data' );
     var aFVARS        = Object.entries(pFVARS).map( ([k,v]) => `  ${k}: ${v}`).join('\n')
  try {
    var mMatch         = aFVARS.match(/DATA_PATH:\s*[\"']?([^\"'\n]+)[\"']?/);
        aDataFolder    = mMatch ? mMatch[1].trim() : aDataFolder;
        aDataFolder    = aDataFolder.replace( /{ProjectDir}/, aRootDir )
        aDataFolder    = aDataFolder.replace( /^\.\./, path.dirname( aRootDir ) )
        aDataFolder    = path.resolve( aDataFolder );
      } catch(e) {
          console_log('! Parsing DATA_FOLDER from FVARS. Using default:', aDataFolder);
          }
//   Create data folder if it doesn't exist
     if (!existsSync(    aDataFolder )) {
          mkdirSync(     aDataFolder, { recursive: true });
          console_log('= Created data folder:', aDataFolder);
          }  
   return aDataFolder 
   }
// ---------------------------------------------------------------------------------

// Parse FVARS from _config.yaml
function parseFVARS( aRootDir, aApp ) {
  try {
      var aConfigPath    = path.join( aRootDir, CONFIG_FILE );
      var aConfigContent = readFileSync( aConfigPath, 'utf8');
    
    // Extract FVARS section
      var mMatch = aConfigContent.match(/FVARS:\s*\n((?:\s+\w+:.*\n?)*)/);
     if (!mMatch) { return {}; } 
    
      var aSection = mMatch[1];
      var fvars = { };
    
    // Parse each variable
    const mLines = aSection.split('\n');
 for (var aLine of mLines) {
    const mMatch = aLine.match(/\s+(\w+):\s*[\"']?([^\"'\n]+)[\"']?/);
      if (mMatch) {
      var bStripApp = mMatch[1].match( /SERVER|CLIENT/ ) != null                                            // .(51118.01.3 RAM Keep other vars)
//    if (mMatch[1].slice(2,3) == aApp.slice(2,3)) { mMatch[1] = mMatch[1].slice(4) }                       //#.(51116.01.1 RAM Strip aApp if FVAR is for it).(51118.01.4)
      if (bStripApp && mMatch[1].slice(2,3) == aApp.slice(2,3)) { mMatch[1] = mMatch[1].slice(4) }          // .(51118.01.4).(51116.01.1 RAM Strip aApp if FVAR is for it)
          fvars[ mMatch[1] ] = mMatch[2].trim();
          }
      }
 } catch (error) {
          console_log('! Parsing FVARS:', error.message);
          fvars = { };
          }
          fvars.PROJECT_NO      =  fvars.PROJECT_NO || "49"
          fvars.PROJECT_NAME    =  fvars.PROJECT_NAME || `Project-${fvars.PROJECT_NO}`
          fvars.PROJECT_VERSION =  fvars.PROJECT_VERSION || "1.10"
          fvars.PROJECT_STAGE   =  path.basename( aRootDir ).toLowerCase()
   return fvars;
   }
// ---------------------------------------------------------------------------------

function console_log(...aMsgs) {
      var bExit = 0  
          aMsgs = aMsgs.map( aMsg => typeof aMsg === 'object' ? JSON.stringify( aMsg, "", 2 ) : aMsg ).join(' ')
      if (aMsgs.slice(0,1) == "=") { aMsgs = `  ✅${            aMsgs.slice(1)}`; }
      if (aMsgs.slice(0,1) == "!") { aMsgs = `  ⚠️  Warning:${  aMsgs.slice(1)}`; }
      if (aMsgs.slice(0,1) == "*") { aMsgs = `  ❌ Soft Error:${aMsgs.slice(1)}`; }
      if (aMsgs.slice(0,1) == "x") { aMsgs = `  🛑 Hard Error:${aMsgs.slice(1)}`; bExit = 1 }
      if (BE_QUIET == 0) { console.log( aMsgs ) }  
      if (bExit    == 1) { process.exit(1) }
          }  
// ---------------------------------------------------------------------------------

function fmtFVARS( mFVars, nWdt ) { 
          if (!nWdt) { nWdt = 20 }
   return mFVars.map( a => { var c = a.replace( /: "/g, `:${''.padEnd( nWdt - (a.indexOf(":") ) ) } "` )  
       return c.replace( /  "\[/, "[" ).replace( /]"/, "]" )
          } ) 
   }
// ---------------------------------------------------------------------------------

function saveFVARS( aApps, fvars) {
      var mApps = aApps.toUpperCase().split( /[, ]/ ).filter(s => s.trim())
          mApps.forEach( aApp => {   
            if (aApp.match( /^[AC]/)) { fmtConfig_js( `C${aApp.slice(1,3)}`, fvars ) }
            if (aApp.match( /^[AS]/)) { fmtConfig_js( `S${aApp.slice(1,3)}`, fvars ) }
            })
       }     
// ---------------------------------------------------------------------------------

function fmtConfig_js( aApp, fvars) {
//    var pFVARS  =  {}; Object.entries(fvars).forEach( ( [aKey,aValue] ) => { if (aKey.startsWith( aApp )) { pFVARS[aKey.slice(4)] = aValue } } )  
      var pFVARS  =  {}; Object.entries(fvars).forEach( chgFVAR )  
      var aConfig_js  = `var _FVARS = ${ fmtFVARS( JSON.stringify( pFVARS, "", 2 ).split("\n"), 24 ).join("\n  ") }` 
      var aType       = 'CLIENT'; if (aApp.match( /^S/ )) { aType = 'SERVER' }
      var aConfigFile = path.join( fvars[ `${aType}_APP_DIR` ], '_config.js' )     
      if (bDoit) { 
//      var aAppName = aConfigFile.match( new RegExp( `${aApp}_.+\\` ) )[0]
      var aAppName  = path.basename( path.dirname( aConfigFile ) )
          console_log( `= Saved FVARS into, _config.js, for: ${aAppName}:\n`, aConfig_js )
          aConfig_js += '\n' 
              + `  if (typeof(window)  != 'undefined') {  window.FVARS  = _FVARS; var aGlobal = "window"  }\n`
              + `  if (typeof(process) != 'undefined') {  process.FVARS = _FVARS; var aGlobal = "process" }\n`
              + `   \n`
              + `      console.log( \`\${aGlobal}.FVARS:\`, fmtFVARS( JSON.stringify( _FVARS, "", 2 ).split("\\n") ).join("\\n") )\n`
              + `      function fmtFVARS( mFVars ) { return mFVars.map( a => a.replace( /: "/g, \`:\${''.padEnd( 20 - (a.indexOf(":")) )} "\` ) ) }\n`
          writeFileSync( aConfigFile, aConfig_js);
      } else {  
          console_log( `= These FVARS will be saved in ${aConfigFile}:\n`, aConfig_js )
        }  
 function chgFVAR( mFVAR ) {
    var [ aKey, aValue ] = mFVAR
      if (aKey.startsWith( aApp )) { 
      var bStripApp      = true // aKey.includes( (aApp[1] == 'C') ? 'CLIENT' : 'SERVER' ) 
      var aKey2 = bStripApp ? aKey.slice(4) : aKey  
          pFVARS[aKey2]  = aValue }  
          }
    }
// ---------------------------------------------------------------------------------

function saveFVARS1(aApp, fvars) {
      var pFVARS = { };
    if (aApp.match( /^[AS]/)) { var nApp = aApp.slice(1) 
        pFVARS[ `S${nApp}_DATA_PATH`      ] = process.FVARS.DATA_PATH 
        pFVARS[ `S${nApp}_CLIENT_PORT`    ] = process.FVARS.CLIENT_PORT
        pFVARS[ `S${nApp}_CLIENT_HOST`    ] = process.FVARS.CLIENT_HOST
        pFVARS[ `S${nApp}_SERVER_PORT`    ] = process.FVARS.SERVER_PORT
        pFVARS[ `S${nApp}_SERVER_API_URL` ] = process.FVARS.SERVER_API_URL
    var aConfig_js = `var FVARS = ${ fmtFVARS( JSON.stringify( pFVARS, "", 2 ).split("\n"), 24 ).join("\n  ") }` 
        console_log( `= Saved FVARS for s${nApp}:\n`, aConfig_js )
        }
    var pFVARS = { };
    if (aApp.match( /^[AC]/)) { var nApp = aApp.slice(1) 
        pFVARS[ `C${nApp}_CLIENT_PORT`    ] = process.FVARS.CLIENT_PORT
        pFVARS[ `C${nApp}_CLIENT_HOST`    ] = process.FVARS.CLIENT_HOST
    var aConfig_js = `var FVARS = ${ fmtFVARS( JSON.stringify( pFVARS, "", 2 ).split("\n"), 23 ).join("\n  ") }` 
        console_log( `= Saved FVARS for c${nApp}:\n`, aConfig_js )
        }
    }
// ---------------------------------------------------------------------------------

// Auto-initialize if run directly
    var aThisFile   = (await import.meta.url).replace( /file:\/\/\/*/, '' )
    if (aThisFile ===  process.argv[1].replace( /\\/g, '/' )) {
        aApps.split( /[, ]/).filter(s => s.trim()).forEach( aApp => {  
          console_log( "----------------------------------------------------------------------\n" )
          initFVARS( aApp );
          saveFVARS( aApp, process.FVARS ); 
          })
        }
// ---------------------------------------------------------------------------------
