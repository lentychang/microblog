from app import create_app, db, cli
from app.models import User, Post
from app import cli
from app.models import User, Post, Notification, Message, Task

app = create_app()
cli.register_cli(app)

@app.shell_context_processor
def make_shell_context():
    return {'db': db, 'User': User, 'Post': Post, 'Message': Message,
            'Notification': Notification, 'Task': Task}

if __name__ == "__main__":
    app.run(port='5000')