function AdvancedLoader() {
  # Assuming 'files.list' contains a list of filenames, one per line
  for file in $(cat Cecho_functions.list); do
    echo "Loading Function: $file"
    source $file
    if [ $? -eq 0 ] 
    then 
      echo "Successfully Loaded Function: $file." 
    exit 0 
    else 
      echo "ERROR: Could not load function: $file! " >&2 
    exit 1 
    fi
  done  
}
