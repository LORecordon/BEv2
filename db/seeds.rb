# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Rails.application.eager_load!


# PREGUNTAS RSP

User.create(email: "first@gmail.com", password: "12345678")
User.create(email: "secondt@gmail.com", password: "12345678")

Question.create(
    prompt: "Que es CORRECTO afirmar con respecto a la corriente:",
    style: 0,
    answer: "Corresponde a la tasa de movimiento de cargas eléctricas en el tiempo debido a un campo electrico",
    difficulty: 1,
    topic: "RSP",
    fake_answers: [
        "Corresponde al voltaje producido en una resistencia debido a cargas polarizadas",
        "Corresponde al flujo de campo electrico producido por cargas en movimiento",
        "Corresponde a la intensidad de electrones en movimiento por unidad de area por unidad de tiempo"
    ]
)

Question.create(
    prompt: "En un circuito con 3 resistencias en serie, todas de 10 ohms, ¿Cual es la resistencia total del circuito?",
    style: 0,
    answer: "30 Ohms",
    difficulty: 1,
    topic: "RSP",
    fake_answers: ["10 Ohms", "20 Ohms", "15 Ohms", "3.33 Ohms", "60 Ohms", "0 Ohms", "33 Ohms"]
    )

Question.create(
    prompt: "En un circtuito con 2 resistencias de 8 Ohms en paralelo, ¿Cual es la resistencia total del circuito?",
    style: 0,
    answer: "4 Ohms",
    difficulty: 1,
    topic: "RSP",
    fake_answers: ["16 Ohms", "20 Ohms", "8 Ohms", "24 Ohms", "30 Ohms", "2 Ohms"]
)

Question.create(
    prompt: "¿Que es la resistencia equivalente de un circuito?",
    style: 0,
    answer: "La suma algebraica de todas las resistencias del circuito",
    difficulty: 1,
    topic: "RSP",
    fake_answers: [
        "La resistencia mayor del circuito",
        "La resistencia menor del circuito",
        "Siempre será la suma de solo las resistencias en serie",
        "Siempre será la suma de solo las resistencias en paralelo",
        "El voltaje del circuito dividido en la resistencia mayor",
        "Un diagrama que demuestra la direccion de la corriente"
    ]
)

Question.create(
    prompt: "Si se tiene un circuito solamente con dos resistencias de 1 Ohm y sin fuente de voltaje, ¿Cual es la corriente maxima del circuito?",
    style: 0,
    answer: "0 A",
    difficulty: 1,
    topic: "RSP",
    fake_answers: ["1 A", "2 A", "4 A", "0.5 A", "0.2 A", "-1 A", "10 A", "20 A"]
)

#aa = Question.create(
#    prompt: "¿Como se calcula la corriente de un circuito si tenemos el voltaje (V) y la resistencia equivalente (R)?",
#    answer: "V/R = I",
#    difficulty: 1,
#    topic: "RSP",
#    fake_answers: ["V*R = I", "R/V = I", "V*2/R = I", "V/(R*2) = I", "V*V*R = I"]
#)

#aa.image.attach(
#    io: File.open("app/images/cattest.jpeg"),
#    filename: "cattest.jpeg",
#    content    style: "image/jpeg"
#)

Question.create(
    prompt: "Imagine que ustéd realiza un experimento creando circuitos en serie y/o en paralelo. Usted dispone de 2 ampolletas iguales, una fuente de voltaje, un medidor de voltaje y un medidor de corriente. ¿Cual de las siguientes opciones es una observación correcta?",
    style: 0,
    answer: "Al disminuir el voltaje las ampolletas disminuyen su brillo, pero aun se mide corriente en el circuito",
    difficulty: 2,
    topic: "RSP",
    fake_answers: [
        "Al conectar las ampolletas en serie, la que está mas cerca de la fuente de voltaje brilla mas y se mide mas corriente en esa",
        "Al conectar las ampolletas en paralelo, las ampolletas brillan distinto y las corrientes medidas en cada ampolleta seran distintas",
        "Al aumentar el voltaje, las ampolletas aumentaran su brillo y se medira menos corriente en ellas"
    ]
)


#PREGUTAS RC

Question.create(
    prompt: "Cual de las siguientes opciones es SIEMPRE CORRECTA respecto a un capacitor de placas paralelas de un circuito",
    style: 0,
    answer: "El campo electrico entre las placas del capacitor disminuye si se le introduce un dielectrico",
    difficulty: 2,
    topic: "RC",
    fake_answers: [
        "La energia electrica del capacitor en cada placa es aproximadamente igual",
        "El potencial electrico entre las placas del capacitor no depende de la distancia entre ellos",
        "Entre las placas del capacitor existe un traspaso de cargas constante"
    ]
)

#temp = Question.create(
#    prompt: "Considere el circuito de la siguiente figura. Determine la corriente que circula por la resistencia R = 10 Ohms, el condensador esta inicialmente descargado.",
#    answer: "1.2 A",
#    difficulty: 3,
#    topic: "RC",
#    fake_answers: ["2.1 A", "3.1 A", "1.3 A", "1 A", "2 A", "12 A"]
#)

#temp.image.attach(
#    io: File.open("app/images/rc1.png"),
#    filename: "rc1.png", 
#    content    style: "image/png"
#)

#temp = Question.create(
#    prompt: "Considere el circuito de la siguiente figura. Determine la corriente que circula por la resistencia de 20 Ohms si el condensador esta completamente cargado.",
#    answer: "0.6 A",
#    difficulty: 2,
#    topic: "RC",
#    fake_answers: ["1.2 A", "2.1 A", "0.4 A", "1 A", "2 A", "0.8 A"]
#)

#temp.image.attach(
#    io: File.open("app/images/rc1.png"),
#    filename: "rc1.png", 
#    content    style: "image/png"
#)



#PREGUNTAS CECP 

#temp = Question.create(
#    prompt: "La figura acontinuación representa dos esferas conductoras de 2cm y 4cm de radio, conectadas por un cable mas largo que los radios en conjunto. Luego de cargar las esferas, se mide que el campo electrico en la superficie de las esfera de 4cm de radio es de 100 kV/m. Entonces, ¿cuanto vale el potencial electrico en la superficie de la esfera de radio 2 cm?",
#    answer: "4 kV",
#    difficulty: 3,
#    topic: "CECP",
#    fake_answers: ["2 kV", "1 kV", "2.4 kV", "6kV", "4.8 kV", "0.5kV"]
#)

#temp.image.attach(
#    io: File.open("app/images/cecp1.png"),
#    filename: "cecp1.png",
#    content    style: "image/png"
#)

Question.create(
    prompt: "La ley de Gaus aplicada a cuerpos puntuales será invalida si:",
    style: 0,
    answer: "La ley del inverso del cuadrado de la distancia no fuera valida",
    difficulty: 1,
    topic: "CECP",
    fake_answers: [
        "La rapidez de la luz en el vacio no fuera constante",
        "Existieran los monopolos magneticos",
        "La cuarta ley de newton no se cumple"
    ]
)

Question.create(
    prompt: "El campo electrico corresponde a:",
    style: 0,
    answer: "Una propiedad del espacio y es causa de la interaccion entre cargas",
    difficulty: 1,
    topic: "CECP",
    fake_answers: [
        "Una propiedad de los cuerpos para interactuar electricamente",
        "La fuerza ejercida por una carga positiva en un punto del espacio", 
        "La fuerza experimentada por una carga positiva en una region del espacio"
    ]
)

Question.create(
    prompt: "La ley de Gauss establece que la carga encerrada por una superficie cerrada es directamente proporcional a:",
    style: 0,
    answer: "El flujo de campo electrico que atraviesa la superficie",
    difficulty: 2,
    topic: "CECP",
    fake_answers: [
        "La intensidad de lineas de campo electrico en todos los puntos de la superficie",
        "La intensidad de campo electrico en todos los puntos de la superficie",
        "El flujo de lineas de campo electrico a traves de la superficie"
    ]
)

Question.create(
    prompt: "Cual de las siguientes opciones es CORRECTA respecto de la relacion entre las lineas de campo electrico y las curvas equipotenciales",
    style: 0,
    answer: "Son perpendiculares en toda la region del espacio",
    difficulty: 3,
    topic: "CECP",
    fake_answers: [
        "Son tangentes en toda la region del espacio",
        "Se intersectan si las cargas que producen el campo no son puntuales",
        "Se intersectan en un solo punto si las cargas que general el campo son puntuales"
    ]
)