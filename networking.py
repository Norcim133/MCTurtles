import socket
import websockets
import asyncio
import traceback

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
    s.connect(('8.8.8.8', 53))
    MY_IP = s.getsockname()[0]

print(MY_IP)

async def register_client(websocket, _):
    #This function does all the things we do once client connects
    async for message in websocket:
        print(message)

async def port_scan():
    if not MY_IP[:3] in ['192', '10', '172']:
        print("This is not a private network")

if __name__ == '__main__':
    start_server = websockets.serve(register_client, MY_IP, 8000)
    asyncio.get_event_loop().run_until_complete(start_server)
    asyncio.get_event_loop().run_forever()