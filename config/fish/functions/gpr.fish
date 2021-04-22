function gpr
  set url (git config --get remote.origin.url | sed -e 's#:#/#' -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%')
  open $url"/compare/"(git rev-parse --abbrev-ref HEAD)"?expand=1"
end
