function gr
  set CURRENT_BRANCH (git rev-parse --abbrev-ref HEAD)
  if string match -r -q '^issue-\d+$' $CURRENT_BRANCH
    git pull-request -i (echo $CURRENT_BRANCH | sed 's/issue-//')
  else
    git pull-request
  end
end