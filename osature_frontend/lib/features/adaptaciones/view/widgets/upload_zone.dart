import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_colors.dart';
import '../../view_model/adapt_document_viewmodel.dart';

// Paso 1: mientras no hay documento se ve el recuadro punteado para
// subirlo, y en cuanto lo hay se cambia por la ficha del archivo.
class UploadZone extends StatelessWidget {
  const UploadZone({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AdaptDocumentViewModel>();

    if (viewModel.documento == null) {
      return _buildZona(context, viewModel);
    }
    return _buildArchivo(context, viewModel);
  }

  Widget _buildZona(BuildContext context, AdaptDocumentViewModel viewModel) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);

    return Semantics(
      button: true,
      label: 'Subir documento',
      child: InkWell(
        onTap: viewModel.subirDocumento,
        excludeFromSemantics: true,
        borderRadius: BorderRadius.circular(AppMedidas.radioGrande),
        child: DottedBorder(
          color: colores.bordeOscuro,
          radio: AppMedidas.radioGrande,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: colores.azulNiebla,
              borderRadius: BorderRadius.circular(AppMedidas.radioGrande),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.file_upload_outlined, size: 30, color: colores.azul),
                const SizedBox(height: 8),
                Text('Arrastra o pulsa aqui', style: estilos.titleMedium),
                Text('PDF, Word o imagen', style: estilos.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArchivo(BuildContext context, AdaptDocumentViewModel viewModel) {
    final estilos = Theme.of(context).textTheme;
    final colores = AppColors.of(context);
    final documento = viewModel.documento!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colores.blanco,
        border: Border.all(color: colores.borde),
        borderRadius: BorderRadius.circular(AppMedidas.radio),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colores.azulClaro,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.insert_drive_file_outlined,
              size: 20,
              color: colores.azul,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  documento.nombre,
                  style: estilos.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(documento.detalle, style: estilos.bodySmall),
              ],
            ),
          ),
          TextButton(
            onPressed: viewModel.quitarDocumento,
            child: const Text('Quitar'),
          ),
        ],
      ),
    );
  }
}

// Recuadro con el borde a rayas. Flutter no trae borde punteado, asi que
// se pinta a mano.
class DottedBorder extends StatelessWidget {
  const DottedBorder({
    super.key,
    required this.color,
    required this.radio,
    required this.child,
  });

  final Color color;
  final double radio;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedBorderPainter(color: color, radio: radio),
      child: child,
    );
  }
}

class _DottedBorderPainter extends CustomPainter {
  _DottedBorderPainter({required this.color, required this.radio});

  final Color color;
  final double radio;

  // Largo de cada raya y del hueco que queda entre ellas.
  static const double _raya = 7;
  static const double _hueco = 5;

  @override
  void paint(Canvas canvas, Size size) {
    final pintura = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final borde = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(1, 1, size.width - 2, size.height - 2),
          Radius.circular(radio),
        ),
      );

    // Voy recorriendo el contorno y pintando solo los trozos de raya.
    for (final tramo in borde.computeMetrics()) {
      double inicio = 0;
      while (inicio < tramo.length) {
        final fin = (inicio + _raya).clamp(0.0, tramo.length);
        canvas.drawPath(tramo.extractPath(inicio, fin), pintura);
        inicio = fin + _hueco;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DottedBorderPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radio != radio;
  }
}
