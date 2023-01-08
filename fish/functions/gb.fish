function gb
  set -l branch (git rev-parse --abbrev-ref HEAD)
  if [ $branch = "trunk" ] || [ $branch = "main" ] || [ $branch = "master" ]
    gh repo view --web
  else
    gh pr view --web
  end
end
