import requests

def notifyMessage():
    payload = {'message': 'Start automation test'}
    return _lineNotifyMessage(payload)

def notifyFile(filename):
    file = {'imageFile':open(filename,'rb')}
    payload = {'message': 'Please see details in report : '}
    return _lineNotifyFile(payload,file)

def _lineNotifyMessage(payload):
    # import requests
    url = 'https://notify-api.line.me/api/notify'
    token = 'wwrEENrGHpiWtCaYSqh33rOnrSgQKTgom0xljeuG5Nv'	#EDIT
    headers = {'Authorization':'Bearer '+token}
    return requests.post(url, headers=headers , data = payload)

def _lineNotifyFile(payload,file=None):
    # import requests
    url = 'https://notify-api.line.me/api/notify'
    token = 'wwrEENrGHpiWtCaYSqh33rOnrSgQKTgom0xljeuG5Nv'	#EDIT
    headers = {'Authorization':'Bearer '+token}
    return requests.post(url, headers=headers , data = payload, files=file)
