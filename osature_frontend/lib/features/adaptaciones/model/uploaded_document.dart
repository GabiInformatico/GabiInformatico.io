// El documento que el usuario ha subido.
class UploadedDocument {
  const UploadedDocument({required this.nombre, required this.detalle});

  final String nombre;
  final String detalle;
}

// Documento de mentira, hasta que se pueda subir uno de verdad.
const UploadedDocument documentoDePrueba = UploadedDocument(
  nombre: 'documento.pdf',
  detalle: '3 paginas, 480 KB',
);
