Instalar Lens(es un monitor) y Heml para Kbernets

https://github.com/arsahosting/seminario-k8s-iac

kubernetes en docker

en 0 -k8s setup

    kubectl create ns traefik
    helm repo add traefik https://traefik.github.io/charts
    helm repo update
    helm install --namespace=traefik -f traefik/values.yml traefik traefik/traefik

Creamos el ingress de Treafik dentro del cluster:
  
    kubectl apply -f traefik/ingress.yml


cambiar github/nuestronombre


    