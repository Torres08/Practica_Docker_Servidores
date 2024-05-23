from flask import Flask, render_template

app=Flask(__name__,static_folder='static')

@app.route('/')
def cielo():
    parametro='cielo.jpg'
    return render_template('imagen.html', parametro=parametro)

@app.route('/cat')
def cat():
    parametro='cat.jpg'
    return render_template('imagen.html', parametro=parametro)

if __name__ == '__main__':
    app.run()