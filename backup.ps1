# Checking if X: is already mounted
if (get-PSDrive | Where-Object {$_.Name -eq "X"})
{ }
else
# Mounting NAS folder on X:
{ net use X: \\nas\data /USER:user password }

# Mirror copy on NAS
robocopy "C:\data" "X:" /mir /s

# Removing X:
net use X: /delete

# Mirror copy on shared folder "data" of PC1, retry 1 time
robocopy "C:\data" "\\pc1\data" /mir /s /r:1
