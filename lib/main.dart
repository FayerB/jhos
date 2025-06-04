import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuestro Amor',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('💕 Nuestro Amor'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple[100]!,
              Colors.indigo[50]!,
              Colors.purple[50]!,
              Colors.pink[50]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return _buildMenuItem(context, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, int index) {
    final menuItems = [
      {
        'emoji': '💬',
        'title': 'Mensajes Rápidos',
        'description': 'Mensajes dulces y tiernos',
        'colors': [Colors.pink.withOpacity(0.3), Colors.red.withOpacity(0.1)],
        'page': () => MensajesRapidos(),
      },
      {
        'emoji': '💌',
        'title': 'Cartas de Amor',
        'description': 'Cartas largas y románticas',
        'colors': [Colors.purple.withOpacity(0.3), Colors.deepPurple.withOpacity(0.1)],
        'page': () => CartasAmor(),
      },
      {
        'emoji': '🤝',
        'title': 'Días Juntos',
        'description': 'Contador de nuestra relación',
        'colors': [Colors.indigo.withOpacity(0.3), Colors.blue.withOpacity(0.1)],
        'page': () => ContadorDias(),
      },
      {
        'emoji': '⏰',
        'title': 'Countdown',
        'description': 'Días para vernos',
        'colors': [Colors.teal.withOpacity(0.3), Colors.cyan.withOpacity(0.1)],
        'page': () => CountdownVernos(),
      },
      {
        'emoji': '❤️',
        'title': 'Razones de Amor',
        'description': 'Por qué te amo tanto',
        'colors': [Colors.red.withOpacity(0.3), Colors.pink.withOpacity(0.1)],
        'page': () => RazonesAmor(),
      },
      {
        'emoji': '📸',
        'title': 'Foto del Día',
        'description': 'Momentos especiales',
        'colors': [Colors.orange.withOpacity(0.3), Colors.amber.withOpacity(0.1)],
        'page': () => FotoDelDia(),
      },
      {
        'emoji': '😊',
        'title': 'Mi Estado',
        'description': 'Cómo me siento hoy',
        'colors': [Colors.green.withOpacity(0.3), Colors.lightGreen.withOpacity(0.1)],
        'page': () => MoodDelDia(),
      },
      {
        'emoji': '📅',
        'title': 'Fechas Importantes',
        'description': 'Aniversarios especiales',
        'colors': [Colors.deepPurple.withOpacity(0.3), Colors.purple.withOpacity(0.1)],
        'page': () => FechasImportantes(),
      },
    ];

    final item = menuItems[index];
    return _buildGlassCard(
      context,
      item['emoji'] as String,
      item['title'] as String,
      item['description'] as String,
      item['colors'] as List<Color>,
      () => Navigator.push(
        context, 
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => (item['page'] as Function)(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 200),
        ),
      ),
            );
          

  }

  Widget _buildGlassCard(BuildContext context, String emoji, String titulo, String descripcion, List<Color> colors, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 12),
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6),
              Text(
                descripcion,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      );
   
  }
}

class MensajesRapidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('💬 Mensajes Rápidos'),
      body: _buildGlassPage('Próximamente...\nMensajes rápidos y dulces para compartir'),
    );
  }
}

class CartasAmor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('💌 Cartas de Amor'),
      body: _buildGlassPage('Próximamente...\nCartas largas y románticas para expresar todo mi amor'),
    );
  }
}

class CountdownVernos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('⏰ Countdown'),
      body: _buildGlassPage('Próximamente...\nContador de días para nuestro próximo encuentro'),
    );
  }
}

class RazonesAmor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('❤️ Razones por las que te amo'),
      body: _buildGlassPage('Próximamente...\nTodas las razones infinitas por las que te amo'),
    );
  }
}

class FotoDelDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('📸 Foto del Día'),
      body: _buildGlassPage('Próximamente...\nCompartir nuestros momentos especiales cada día'),
    );
  }
}

class MoodDelDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('😊 Mi Estado de Ánimo'),
      body: _buildGlassPage('Próximamente...\nCompartir cómo me siento cada día'),
    );
  }
}

class FechasImportantes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('📅 Fechas Importantes'),
      body: _buildGlassPage('Próximamente...\nAniversarios y recuerdos especiales de nuestra relación'),
    );
  }
}

class ContadorDias extends StatefulWidget {
  @override
  _ContadorDiasState createState() => _ContadorDiasState();
}

class _ContadorDiasState extends State<ContadorDias> with TickerProviderStateMixin {
  DateTime? fechaInicio;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Configura aquí tu fecha de inicio de la relación
    // Por ejemplo: DateTime(2023, 1, 15) para 15 de enero de 2023
    fechaInicio = DateTime(2025, 1, 02); // ¡CAMBIA ESTA FECHA POR LA TUYA!
    
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800), // Reducido de 1200ms
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int _calcularDiasJuntos() {
    if (fechaInicio == null) return 0;
    final ahora = DateTime.now();
    final diferencia = ahora.difference(fechaInicio!);
    return diferencia.inDays + 1; // +1 para incluir el día de inicio
  }

  String _obtenerMensajeEspecial(int dias) {
    if (dias >= 365) {
      int anos = (dias / 365).floor();
      int diasRestantes = dias % 365;
      return "¡$anos año${anos > 1 ? 's' : ''} y $diasRestantes días de amor! 💕";
    } else if (dias >= 30) {
      int meses = (dias / 30).floor();
      return "¡Más de $meses mes${meses > 1 ? 'es' : ''} juntos! 💖";
    } else if (dias >= 7) {
      int semanas = (dias / 7).floor();
      return "¡$semanas semana${semanas > 1 ? 's' : ''} de felicidad! 💜";
    } else {
      return "¡Cada día es especial contigo! 💝";
    }
  }

  List<String> _obtenerMilestones(int dias) {
    List<String> milestones = [];
    
    if (dias >= 100) milestones.add("✨ ¡100 días juntos!");
    if (dias >= 365) milestones.add("🎉 ¡Un año completo!");
    if (dias >= 500) milestones.add("💫 ¡500 días de amor!");
    if (dias >= 730) milestones.add("🥳 ¡Dos años juntos!");
    if (dias >= 1000) milestones.add("🌟 ¡1000 días increíbles!");
    
    return milestones;
  }

  @override
  Widget build(BuildContext context) {
    final diasJuntos = _calcularDiasJuntos();
    final milestones = _obtenerMilestones(diasJuntos);
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildGlassAppBar('🤝 Días Juntos'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple[100]!,
              Colors.indigo[50]!,
              Colors.purple[50]!,
              Colors.pink[50]!,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        
                        // Contador principal
                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: _buildGlassContainer(
                                child: Column(
                                  children: [
                                    Text(
                                      '$diasJuntos',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple[700],
                                        shadows: [
                                          Shadow(
                                            blurRadius: 10.0,
                                            color: Colors.deepPurple.withOpacity(0.3),
                                            offset: Offset(2.0, 2.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      diasJuntos == 1 ? 'Día Juntos' : 'Días Juntos',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      _obtenerMensajeEspecial(diasJuntos),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        
                        SizedBox(height: 30),
                        
                        // Información adicional
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: _buildGlassContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, color: Colors.deepPurple[600], size: 24),
                                    SizedBox(width: 10),
                                    Text(
                                      'Desde el inicio',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                
                                _buildInfoRow('📅', 'Fecha de inicio', 
                                  fechaInicio != null 
                                    ? '${fechaInicio!.day}/${fechaInicio!.month}/${fechaInicio!.year}'
                                    : 'No configurada'),
                                
                                _buildInfoRow('⏰', 'Tiempo total', 
                                  '${(diasJuntos / 7).floor()} semanas y ${diasJuntos % 7} días'),
                                
                                _buildInfoRow('🌙', 'Noches juntos', 
                                  '${diasJuntos - 1} noches'),
                                
                                _buildInfoRow('💌', 'Días de amor', 
                                  '$diasJuntos días de felicidad'),
                              ],
                            ),
                          ),
                        ),
                        
                        // Milestones alcanzados
                        if (milestones.isNotEmpty) ...[
                          SizedBox(height: 30),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: _buildGlassContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.emoji_events, color: Colors.amber[600], size: 24),
                                      SizedBox(width: 10),
                                      Text(
                                        'Logros Alcanzados',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  ...milestones.map((milestone) => 
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 4),
                                      child: Text(
                                        milestone,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                
                // Botón para cambiar fecha
                _buildGlassButton(
                  onTap: () => _mostrarSelectorFecha(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_calendar, color: Colors.deepPurple[600]),
                      SizedBox(width: 10),
                      Text(
                        'Cambiar Fecha de Inicio',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildGlassButton({required Widget child, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.withOpacity(0.2),
              Colors.indigo.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  Widget _buildInfoRow(String emoji, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 18)),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarSelectorFecha(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: fechaInicio ?? DateTime.now().subtract(Duration(days: 365)),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (fechaSeleccionada != null) {
      setState(() {
        fechaInicio = fechaSeleccionada;
      });
      
      // Reiniciar animación
      _animationController.reset();
      _animationController.forward();
    }
  }
}

// Funciones auxiliares para el estilo glass optimizado
AppBar _buildGlassAppBar(String title) {
  return AppBar(
    title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
    backgroundColor: Colors.deepPurple.withOpacity(0.3),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  );
}

Widget _buildGlassPage(String text) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.deepPurple[100]!,
          Colors.indigo[50]!,
          Colors.purple[50]!,
          Colors.pink[50]!,
        ],
      ),
    ),
    child: SafeArea(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}