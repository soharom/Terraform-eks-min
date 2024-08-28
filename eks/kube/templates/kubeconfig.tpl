apiVersion: v1
kind: Config
clusters:
- name: ${kubeconfig_name}
  cluster:
    server: ${endpoint}
    certificate-authority-data: ${cluster_auth_base64}
contexts:
- name: ${kubeconfig_name}
  context:
    cluster: ${kubeconfig_name}
    user: ${kubeconfig_name}
current-context: ${kubeconfig_name}
users:
- name: ${kubeconfig_name}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: ${aws_authenticator_command}
      args:
        - ${aws_authenticator_command_args[0]}
        - ${aws_authenticator_command_args[1]}
        - ${aws_authenticator_command_args[2]}
