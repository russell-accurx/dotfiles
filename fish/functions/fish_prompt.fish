set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)

set -l normal_color (set_color normal)
set -l red_color (set_color red)

function fish_prompt
  set -l current_dir (pwd | sed -e "s|$HOME|~|")
  set -l repo_name
  set -l branch_name


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

  set branch_name (git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if test -n "$repo_name"
    set_color blue
    echo -n -s "[$repo_name] "
    set_color normal
    if test -n "$branch_name"
      set_color green
      echo -n -s "[$branch_name] "
      set_color normal
      if not test "$current_dir" = ""
        echo -n -s "$current_dir "
      end
    end
  else
    set_color normal
    echo -n -s "$current_dir "
  end
  set_color green
  echo -n -s "👉🏻 "
  set_color normal
end
