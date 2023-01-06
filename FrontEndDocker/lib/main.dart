import 'package:flutter/material.dart';
import 'package:frontend_docker/model/comida.dart';
import 'services/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Front End Docker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Docker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<Comida>? listComida;

  final controllerNombre = TextEditingController();
  final controllerprecio = TextEditingController();
  final controllercalorias = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    listComida = await ApiService().getComidas();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          formulario(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          listComida == null || listComida!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listComida!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(listComida![index].id.toString()),
                          const SizedBox(height: 10.0,),
                          Text(listComida![index].nombre),
                          const SizedBox(height: 10.0,),
                          Text(listComida![index].precio),
                          const SizedBox(height: 10.0,),
                          Text(listComida![index].calorias)
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.refresh),onPressed: () {
        setState(() {});
      }),
    );
  }

  Widget formulario() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          crearCampo("Nombre del platillo", TextInputType.text, controllerNombre),
          crearCampo("precio del platillo", TextInputType.text, controllerprecio),
          crearCampo("calorias del platillo", TextInputType.number, controllercalorias),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(onPressed: () {
            String nombre = controllerNombre.text;
            String precio = controllerprecio.text;
            String calorias = controllercalorias.text;
            Comida comida = Comida(id: 0, nombre: nombre, precio: precio, calorias: calorias);
            ApiService().insertarComida(comida);
            setState(() {});
          }, child: const Text("Insertar"))
        ],
      ),
    );
  }

  Widget crearCampo(String valorCampo, TextInputType tipo, TextEditingController control) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text("$valorCampo:"),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: tipo,
              controller: control,
            ),
          )),
        ],
      ),
    );
  }
}
