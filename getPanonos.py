import websocket
import json

def askForUpf(ws, count):
    upf = []
    ws.send("{\"id\":"+str(count)+",\"method\":\"get_upf_infos\",\"jsonrpc\":\"2.0\"}")
    response = ws.recv()
    rep = json.loads(response)
    for key in rep:
        if key == "result":
            for captures in rep["result"]["upf_infos"]:
                for capture in captures:
                    upf.append(captures['upf_url'])
    for i in upf:
        print i

def takeAction(ws):
    count = 1
    askForUpf(ws, count)
    ws.close()

if __name__ == "__main__":
    ws = websocket.create_connection("ws://192.168.80.80:12345/8086")
    try:
        takeAction(ws)
    except KeyboardInterrupt:
        ws.close()
