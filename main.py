from http.server import BaseHTTPRequestHandler, HTTPServer
import time
import asyncio
import websockets

# create handler for each connection

async def handler(websocket, path):
    data = await websocket.recv()

    reply = f"Hello world!"

    await websocket.send(reply)


start_server = websockets.serve(handler, "localhost", 8000)

asyncio.get_event_loop().

asyncio.get_event_loop().run_forever()