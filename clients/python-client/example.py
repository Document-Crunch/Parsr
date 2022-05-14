from parsr_client import ParsrClient
from parsr_client import ParsrOutputInterpreter


try:
  parsr = ParsrClient('parser.ml.documentcrunch.com')
  result = parsr.send_document(file_path='45. Good Owner Friendly Contract.pdf',
  config_path='defaultConfig.json',
  document_name='The Readme',
  wait_till_finished=True,
  save_request_id=True)

  print(result)
  print(result.get_json())
except Exception as e: 
  print(e)  
