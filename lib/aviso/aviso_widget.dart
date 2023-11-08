import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'aviso_model.dart';
export 'aviso_model.dart';

class AvisoWidget extends StatefulWidget {
  const AvisoWidget({super.key});

  @override
  _AvisoWidgetState createState() => _AvisoWidgetState();
}

class _AvisoWidgetState extends State<AvisoWidget>
    with TickerProviderStateMixin {
  late AvisoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 110.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvisoModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF606A85),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AVISO DE PRIVACIDAD',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFF15161E),
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'LOPICONCEPTO S.A de C.V. S. A. DE C. V., con domicilio en Calle Reforma, número ciento treinta y nueve, en Tlaquepaque, Jalisco, México mismo que se señala como domicilio para recibir notificaciones; es responsable de recabar, usar y proteger sus datos personales, tales como: nombre, domicilio, clave única de registro de población, registro federal de contribuyentes, número telefónico, edad, género, entre otros; y sus datos personales sensibles que pueden ser tales como: origen racial y étnico, estado de salud presente o futuro, información genética, creencias religiosas, filosóficas y morales, afiliación sindical, opiniones políticas y preferencia sexual. Los datos personales, aun los sensibles, serán protegidos, incorporados y tratados, según corresponda, en los sistemas de información de LOPICONCEPTO S.A de C.V. y de terceros que la empresa contrate para que la provean de productos y servicios, cuando eso sea necesario.\n\nLos registros recabados y el tratamiento de datos asociados a los mismos, se sujetaran a lo dispuesto por la Ley Federal de Protección de Datos Personales en Posesión de los Particulares, las disposiciones que de ella emanen, a la correlativa legislación vigente en el ámbito local y a las normas y reglamentos institucionales aplicables en México.\n\nLos datos personales que se recaban con motivo del presente formato, aquellos que deriven de la relación laboral entre la empresa y empleados y los que la misma obtenga de otras fuentes permitidas por la ley, serán transmitidos a las autoridades competentes, locales y federales, exclusivamente para el ejercicio de sus atribuciones, así como a entidades y dependencias externas a la institución, publicas y privadas, que los requieran para ejercer sus funciones, en cuyo caso la información será disociada de su titular siempre que sea posible.\n\nLos datos personales en posesión de LOPICONCEPTO S. A. DE C. V. podrán ser transferidos a terceros nacionales o extranjeros que la empresa contrate para que la provean de productos y servicios, para las finalidades exclusivamente necesarias para la provisión del bien o servicio contratado.\n\nLos datos personales recabados, incluso los sensibles, aquellos que deriven de la relación laboral entre el titular y empleados y los que la misma obtenga de otras fuentes permitidas por la ley, tienen como finalidades principales las de identificar, localizar y contactar al titular, así como la operación y administración de su expediente, en los ámbitos laborales, publicitarios, de salud y cualquier otro de los que conforman los servicios que LOPICONCEPTO  S. A. DE C. V. y terceros que la misma contrate para que le provean de servicios, teniendo como finalidades accesorias la investigación para la toma de decisiones en los procesos de planeación y evaluación institucionales.\n\nEn caso de que usted no esté de acuerdo en que LOPICONCEPTO S. A. DE C. V. lleve a cabo las finalidades accesorias que se mencionan con anterioridad, usted cuenta con un plazo de cinco días, contados a partir de que tenga conocimiento del presente aviso, para manifestar por escrito su negativa a dicho tratamiento, para lo cual deberá dirigirlo a la autoridad encargada de los datos personales, y entregarlo en las oficinas de LOPICONCEPTO S. A. DE C. V. acompañada de una copia simple de identificación oficial con fotografía y firma del titular de los datos; tratándose de representante, éste deberá presentar además instrumento cetificado o carta poder original en la que consten sus facultades.\n\n \n\nLa autoridad encargada de los datos personales en LOPICONCEPTO S. A. DE C. V. es únicamente el personal autorizado, que ha cumplido y observado los correspondientes requisitos de confidencialidad. El ejercicio de los derechos ARCO (acceso, rectificación, cancelación, oposición), así como de divulgación, limitación de uso o revocación del consentimiento a los datos personales, deberá hacerse por escrito, dirigido a Andrés Octavio López Victoria Zamudio, con número telefónico xxxxx, correo electrónico xxx, y domicilio ubicado en Calle Reforma, número ciento treinta y nueve, en Tlaquepaque, Jalisco, México, quien será la autoridad encargada de los datos personales, entregado en las oficinas de LOPICONCEPTO S. A. DE C. V., acompañada de una copia simple de identificación oficial con fotografía y firma del titular de los datos; tratándose de representante, éste deberá presentar además instrumento cetificado o carta poder original en la que consten sus facultades.\n\nLOPICONCEPTO S. A. DE C. V. le informará por escrito su respuesta dentro de los cinco días siguientes a que se haya presentado la solicitud. En caso de requerirlo, podrá solicitar también por escrito, copia simple de la información de la cual usted es titular, y que se encuentre en posesión de LOPICONCEPTO S. A. DE C. V., quien contará con un plazo de cinco días para hacerle entrega de la información solicitada. Para obtener mayor información respecto al procedimiento para el ejercicio de los derechos contemplados en el presente párrafo, usted podrá solicitarla directamente con la responsable de los datos personales.\n\nLOPICONCEPTO S. A. DE C. V. se reserva el derecho de efectuar modificaciones o actualizaciones en cualquier momento al presente aviso de privacidad, para incluir información producto de modificaciones a las leyes aplicables, políticas internas, nuevos requerimientos para la presentación de sus servicios, entre otros.\n\n \n\nCONSENTIMIENTO PARA EL TRATAMIENTO DE DATOS\n\nAutorizo a LOPICONCEPTO S. A. DE C. V. para que me haga llegar por correo electrónico, correo postal, teléfono o mensajes de texto cualquier información relativa a mi proceso de ingreso y/o a mi relación laboral con esta empresa.\n\n \n\nAutorizo a LOPICONCEPTO S. A. DE C. V., para que los datos personales con que ya cuenta y los que se recaban con objeto del presente formato, puedan ser difundidos públicamente o transferidos a otras autoridades con el fin de que sea posible validar mi relación laboral con esta empresa. En estos casos, solo serán publicados los datos mínimos indispensables para realizar la verificación.\n\nAutorizo a LOPICONCEPTO S. A. DE C. V., para que transfiera mis datos personales a terceros nacionales y extranjeros, de conformidad con el presente Aviso de Privacidad.\n\nHe recibido, leído y comprendido los términos del presente Aviso de Privacidad, por lo tanto, al firmarlo consiento y autorizo que mis datos personales sean tratados conforme a lo previsto en el mismo.\n\nPara el caso de colaboradores, con mi firma expreso que entiendo y acepto la obligación que adquiero de guardar confidencialidad respecto de los datos personales a los que tenga acceso, obligación que subsistirá aun después de finalizar mi relación laboral con la empresa, quien podrá ejercer contra mí sanciones internas, así como acciones civiles y/o penales que juzgue pertinentes en caso de que yo incumpla con esta obligación.',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF606A85),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 2.0,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
