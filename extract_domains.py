import csv

def loadData(path_IN,path_OUT):
	with open(path_IN,'rU') as F:
		csvdr = csv.DictReader(F, delimiter=';')
		fields=['document_id','document_url']
		
		with open(path_OUT,'wb') as W:
			csvdw = csv.DictWriter(W,delimiter=';',fieldnames=fields)
			csvdw.writerow(dict((fn,fn) for fn in fields))
			for p  in csvdr:
				print p['document_id'],p['document_url']
				domain=p['document_url'].replace('//','_').split('/')[0].split('.')[-1]
				csvdw.writerow({'document_id':p['document_id'],'document_url':domain})



loadData('sites.csv','domains.csv')