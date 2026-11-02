{ ... }: {
  programs.fish.shellAbbrs = {
    k = "kubectl";
    kx = "kubectx";
    kpw = "kubectl get pods --watch";
    kgp = "kubectl get pods";
    kdpf = "kubectl delete pods --field-selector='status.phase=Failed'";
  };
}
