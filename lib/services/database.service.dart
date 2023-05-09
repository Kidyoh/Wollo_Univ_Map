import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiot_map/models/KiotPlace.model.dart';

class DatabaseService {
  List<KiotPlace> getAllKiotPlaces() {
    final List<KiotPlace> kiotPlaces = [
      KiotPlace(
        id: 1,
        name: "New Liberary",
        location: const LatLng(11.05054792918316, 39.7475981792547),
        image: 'Wollo_university_map_final-dev/images/Fresh man library.jpg',
      ),
      KiotPlace(
        id: 2,
        name: "Main Liberary",
        location: const LatLng(11.049228373433188, 39.748424284919764),
        image: 'Wollo_university_map_final-dev/images/Main Library.jpg',
      ),
      KiotPlace(
        id: 3,
        name: "Informatics Liberary",
        location: const LatLng(11.048813881825973, 39.748614049799855),
        image: 'Wollo_university_map_final-dev/images/Engineering Library.jpg',
      ),
      KiotPlace(
        id: 4,
        name: "Clinic",
        location: const LatLng(11.050011876127659, 39.747769422074825),
        image: 'Wollo_university_map_final-dev/images/Students Clinic.jpg',
      ),
      KiotPlace(
        id: 5,
        name: "Students Lounge",
        location: const LatLng(11.049826283854301, 39.74732576901798),
        image: 'Wollo_university_map_final-dev/images/Students Lounge.jpg',
      ),
      KiotPlace(
        id: 6,
        name: "Teachers Lounge",
        location: const LatLng(11.051413659369077, 39.74840629610825),
        image: 'Wollo_university_map_final-dev/images/Teachers Lounge.jpg',
      ),
      KiotPlace(
        id: 7,
        name: "Class Rooms",
        location: const LatLng(11.050388206250837, 39.74833564759589),
        image: 'Wollo_university_map_final-dev/images/Class room .jpg',
      ),
      KiotPlace(
        id: 8,
        name: "Sport Field",
        location: const LatLng(11.048667588186346, 39.747775389216024),
        image: 'Wollo_university_map_final-dev/images/Sport Field.jpg',
      ),
      KiotPlace(id: 9, 
      name: "Females Dormitory", 
      location: const LatLng(11.048067640731928, 39.74880614529703),
      image: 'Wollo_university_map_final-dev/images/Female Dormitory.jpg'
      ),
      KiotPlace(id: 10, 
      name: "Senior Males Dormitery", 
      location: const LatLng(11.048409865394955, 39.74994340181729),
      image: 'Wollo_university_map_final-dev/images/Male dormitory.jpg'
      ),
      KiotPlace(id: 11, 
      name: "Registrar", 
      location: const LatLng(11.0525979604587, 39.747515374116546),
      image: 'Wollo_university_map_final-dev/images/Registrar Building.jpg'
      ),
      KiotPlace(id: 12, 
      name: "Informatics Laboratory", 
      location: const LatLng(11.0484609310966, 39.7501642678091),
      image: 'Wollo_university_map_final-dev/images/Informatics Lab.jpg'
      ),
       KiotPlace(id: 13, 
      name: "Ancharo", 
      location: const LatLng(11.054155277517383, 39.74977981771949),
      image: ''
      ),
       KiotPlace(id: 14, 
      name: "White House", 
      location: const LatLng(11.049860472683585, 39.750975168631776),
      image: 'Wollo_university_map_final-dev/images/White house.jpg'
      ),
       KiotPlace(id: 15, 
      name: "Informatics College", 
      location: const LatLng(11.051719663305777, 39.74774489462865),
      image: 'Wollo_university_map_final-dev/images/Informatics Building.jpg'
      ),
       KiotPlace(id: 16, 
      name: "Students Cafeteria", 
      location: const LatLng(11.051917857755775, 39.74954755161849),
      image: 'Wollo_university_map_final-dev/images/Cafteria.jpg'
      ),
       KiotPlace(id: 17, 
      name: "Bank & ATM", 
      location: const LatLng(11.051980952622452, 39.74669892974005),
      image: 'Wollo_university_map_final-dev/images/Bank and ATM.jpg'
      ),
       KiotPlace(id: 18, 
      name: "Shops & Photocopy", 
      location: const LatLng(11.048806854002288, 39.748136559691964),
      image: 'Wollo_university_map_final-dev/images/Shops.jpg'
      ),
       KiotPlace(id: 19, 
      name: "Students Union", 
      location: const LatLng(11.049538214694493, 39.74787795702361),
      image: 'Wollo_university_map_final-dev/images/Student Union.jpg'
      ),
       KiotPlace(id: 20, 
      name: "Administration", 
      location: const LatLng(11.052409750780946, 39.74680680588732),
      image: 'Wollo_university_map_final-dev/images/Administration Building .jpg'
      ),
       KiotPlace(id: 21, 
      name: "Gymnasium", 
      location: const LatLng(11.049191370049732, 39.75009020332489),
      image: 'Wollo_university_map_final-dev/images/Gymnasium .jpg'
      ),
       KiotPlace(id: 22, 
      name: "Informatics Laboratory", 
      location: const LatLng(11.0484609310966, 39.7501642678091),
      image: 'Wollo_university_map_final-dev/images/Informatics Lab.jpg'
      ),
     

      // todo: add the remaining data
    ];

    return kiotPlaces;
  }
}
