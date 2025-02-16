{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.l = {
    isNormalUser = true;
    hashedPassword = "$6$uAbjAK7hZFHYdHtM$5CXc5OlVS8z4csbNVVuj9E0Ug4Z4niPIYduBseJNW4SjQlx.Hi1MSxRki5LxRzApSl8G0KOj6STqSRk8Iy.Kw1";
    description = "milk";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
