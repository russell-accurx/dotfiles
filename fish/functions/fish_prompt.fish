function fish_prompt
  set -l current_dir (pwd | sed -e "s|$HOME|~|")
  set -l repo_name
  set -l branch_name
  set -l branch_ahead
  set -l branch_behind
  set -l branch_diverged

  if string match -q -- "~/Code/*" $current_dir
    set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set clean (git status --porcelain .)

    if test -z "$clean"
      set -l git_uno (git status -uno .)
      set branch_ahead (echo $git_uno | grep ahead)
      set branch_behind (echo $git_uno | grep behind)
      set branch_diverged (echo $git_uno | grep diverged)
    end
  end

  if string match -q -- "~/Code/rosemary/src/Web/*" $current_dir
    set current_dir (echo $current_dir | sed -e 's|~/Code/rosemary/src/Web/accuRx.||')
    set repo_name (echo $current_dir | sed -e 's|^\([^/]*\).*$|\1|')
    set current_dir (echo $current_dir | sed -e "s|^$repo_name/*||")
    set repo_name (string lower $repo_name | sed -e 's|\.|-|g')
    if test $repo_name = "web-design"
      set repo_name "accurx-design"
    else if test $repo_name = "web-client-shared"
      set repo_name "accurx-shared"
    end
  else if string match -q -- "~/Code/*" $current_dir
    set current_dir (echo $current_dir | sed -e 's|~/Code/||')
    set repo_name (echo $current_dir | sed -e 's|^\([^/]*\).*$|\1|')
    set current_dir (echo $current_dir | sed -e "s|^$repo_name/*||")
  end



  if test -n "$repo_name"
    set_color blue
    echo -n -s "[$repo_name] "
    set_color normal
    if test -n "$branch_name"
      set_color green
      echo -n -s "[$branch_name] "
      if not test -z "$clean"
        set_color yellow
        echo -n -s "🟡 "
        set_color normal
      else if test $branch_diverged
        echo -n -s "🔀 👉🏻"
      else if test $branch_behind
        echo -n -s "⬇️  👉🏻"
      else if test $branch_ahead
        echo -n -s "⬆️  👉🏻"
      else
        echo -n -s "✅ 👉🏻"
      end
      set_color normal
      if not test "$current_dir" = ""
        echo -n -s "$current_dir "
      end
    end
  else
    set_color normal
    echo -n -s "$current_dir "
    echo -n -s "👉🏻 "
  end
end
