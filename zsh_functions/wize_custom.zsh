##Custom Programs Autocomplete

function listgenerateTriggerCompletions { reply=(--help --table --keys --output  --fields --template --output  ); }

compctl -K listgenerateTriggerCompletions generateTrigger.py
function listgenerateTriggerCompletions { reply=(--help --table --keys --output  --fields --template --output  ); }

function listpublishClientCompletions { 
  local thrift
  read -l thrift
  reply=(-h  --help --local  --docOnly --ruby  --java  --service "$a" --config --compilers --setcompilers  ); 
}

#compctl -K listpublishClientCompletions publishClients.py

