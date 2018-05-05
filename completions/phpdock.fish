function __fish_phpdock_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'phpdock' ]
    return 0
  end
  return 1
end

function __fish_phpdock_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c phpdock -n '__fish_phpdock_needs_command' -a '(phpdock commands)'
for cmd in (phpdock commands)
  complete -f -c phpdock -n "__fish_phpdock_using_command $cmd" -a \
    "(phpdock completions (commandline -opc)[2..-1])"
end
