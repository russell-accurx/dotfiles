function git-trash
  echo "Non-master branches:"
  git branch | grep -v master | grep -v trunk | grep -v main | cat
  echo
  read -P "Delete them all [y/n]? " yn
  switch $yn
    case "y"
      git branch | grep -v master | grep -v trunk | grep -v main | xargs git branch -D
    case '*'
  end
end
