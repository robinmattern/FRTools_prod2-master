#!/bin/bash

echo "Starting formR Sample Client/Server App..."

# Start server in background
echo "Starting server on port 3050..."
cd server/s00_sample-server-api
node server.mjs &
SERVER_PID=$!

# Wait for server to start
sleep 2

# Start client
echo "Starting client on port 3000..."
cd ../../client/c00_sample-client-app
npx http-server -p 3000 -s > /dev/null 2>&1 &
CLIENT_PID=$!

echo "Server running on http://localhost:3050"
echo "Client running on http://localhost:3000"
echo "Press Ctrl+C to stop both services"

# Wait for user interrupt
trap "kill $SERVER_PID $CLIENT_PID; exit" INT
wait