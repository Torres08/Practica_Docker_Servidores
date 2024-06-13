
from locust import HttpUser, TaskSet, task, between

class P5JuanLuis(TaskSet):
   @task(1)
   def access_homepage(self):
        self.client.get("http://host.docker.internal:8010/", verify=False)

   @task(2)
   def login(self):
        # Simulate logging in
        response = self.client.post("http://host.docker.internal:8010/user/login", {
            "name": "your_username",
            "pass": "your_password"
        }, verify=False)
        if response.status_code == 200:
            print("Logged in successfully")

   @task(3)
   def navigate_pages(self):
        pages = ["http://host.docker.internal:8010/node/1", "http://host.docker.internal:8010/node/2", "http://host.docker.internal:8010/node/3"]
        for page in pages:
            self.client.get(page, verify=False)
   
   @task(4)
   def create_content(self):
        # Simula la creación de un nuevo contenido
        response = self.client.post("http://host.docker.internal:8010/node/add/article", {
            "title": "Test Article",
            "body[und][0][value]": "This is a test article created by Locust.",
            "body[und][0][format]": "filtered_html"
        }, verify=False)
        if response.status_code == 403:
            print("Forbidden: You don't have permission to create content")
        elif response.status_code == 200:
            print("Content created successfully")
        else:
            print(f"Failed to create content: {response.status_code}")
   
   @task(5)
   def post_comment(self):
        # Simula la publicación de un comentario
        response = self.client.post("http://host.docker.internal:8010/node/4#comment-form", {  # Cambia 4 por el ID del nodo correcto
            "comment_body[0][value]": "This is a test comment.",
            "comment_body[0][format]": "plain_text"
        }, verify=False)
        if response.status_code == 403:
            print("Forbidden: You don't have permission to post a comment")
        elif response.status_code == 200:
            print("Comment posted successfully")
        else:
            print(f"Failed to post comment: {response.status_code}")

   @task(6)
   def logout(self):
        # Simula el cierre de sesión
        self.client.get("http://host.docker.internal:8010/user/logout", verify=False)

class P5Usuarios(HttpUser):
   tasks = [P5JuanLuis]
   wait_time = between(1, 5)




    