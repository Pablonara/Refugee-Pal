import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/navbars/refugee_nav_bar/refugee_nav_bar_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? categorySelected = 'all';

  bool? showAll = true;

  List<String> searchResults = [];
  void addToSearchResults(String item) => searchResults.add(item);
  void removeFromSearchResults(String item) => searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);

  List<String> resourceSearchResults = [];
  void addToResourceSearchResults(String item) =>
      resourceSearchResults.add(item);
  void removeFromResourceSearchResults(String item) =>
      resourceSearchResults.remove(item);
  void removeAtIndexFromResourceSearchResults(int index) =>
      resourceSearchResults.removeAt(index);

  String? categoryID;

  bool? isNavigate;

  List<String> choiceChipChoices = [];
  void addToChoiceChipChoices(String item) => choiceChipChoices.add(item);
  void removeFromChoiceChipChoices(String item) =>
      choiceChipChoices.remove(item);
  void removeAtIndexFromChoiceChipChoices(int index) =>
      choiceChipChoices.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  List<ResourceproviderRecord> simpleSearchResults1 = [];
  List<SubcategoryRecord> simpleSearchResults2 = [];
  List<ChatsRecord> simpleSearchResults3 = [];
  List<LocationsRecord> simpleSearchResults4 = [];
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Model for refugeeNavBar component.
  late RefugeeNavBarModel refugeeNavBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    refugeeNavBarModel = createModel(context, () => RefugeeNavBarModel());
  }

  void dispose() {
    emailAddressController?.dispose();
    refugeeNavBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
