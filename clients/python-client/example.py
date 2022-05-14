from parsr_client import ParsrClient
from parsr_client import ParsrOutputInterpreter

try:
  parsr = ParsrClient('parser.ml.documentcrunch.com')
  
  #parsr = ParsrClient('localhost:3001')

  result = parsr.send_document(file_path='45. Good Owner Friendly Contract.pdf',
  config_path='defaultConfig.json',
  document_name='The Readme',
 # silent=False,
  wait_till_finished=True,
  save_request_id=True)

  print(result)
  
  parsr_interpreter = ParsrOutputInterpreter(
    parsr.get_json()
    )

  t = parsr_interpreter.get_text(
      page_number=1
  )
  print(t)

except Exception as e: 
  print(e)  
