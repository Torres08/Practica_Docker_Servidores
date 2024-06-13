from locust import HttpUser, TaskSet, task, between

class P5JuanLuis(TaskSet):
   @task
   def access_balancer(self):
       self.client.get("http://host.docker.internal:8010/", verify=False)
       #self.client.get("https://192.168.10.50:443/", verify=False)

class P5Usuarios(HttpUser):
   tasks = [P5JuanLuis]
   wait_time = between(1, 5)