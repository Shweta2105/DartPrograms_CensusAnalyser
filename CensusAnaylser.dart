import 'dart:io';
import 'dart:async';
import 'dart:convert';

// void loadIndiaCensusData(String india_census_csv_file_path) {
main(List<String> args) {
  try {
    final File file = new File("IndiaStateCensusData.csv");
    Stream<List> inputStream = file.openRead();
    inputStream.transform(utf8.decoder).transform(new LineSplitter()).listen(
        (String line) {
      List row = line.split(',');
      String State = row[0];
      // String Population = row[2];
      //String AreaInSqKm = row[3];
      //String DensityPerSqKm = row[4];
      print('$State');
    }, onDone: () {
      print('File is now closed.');
    }, onError: (e) {
      print(e.toString());
    });
  } catch (e) {
    throw Exception();
  }
  try {
    final File file1 = new File("IndiaStateCode.csv");
    Stream<List> inputStream = file1.openRead();
    inputStream.transform(utf8.decoder).transform(new LineSplitter()).listen(
        (String line) {
      List row = line.split(',');
      String SrNo = row[0];
      String State = row[1];
      print('$SrNo');
      print('$State');
    }, onDone: () {
      print('File is now closed.');
    }, onError: (e) {
      print(e.toString());
    });
  } catch (e) {}
}

class IndiaCensusCSV {
  late String State;
  late String Population;
  late String AreaInSqKm;
  late String DensityPerSqKm;

  IndiaCensusCSV(
      this.State, this.Population, this.AreaInSqKm, this.DensityPerSqKm);
  IndiaCensusCSV.fromList(List<String> cols)
      : this(cols[0], cols[1], cols[2], cols[3]);

  @override
  String toString() {
    return 'IndiaCensusCSV{State:$State, Population : $Population, AreaInSqKm :$AreaInSqKm, DensityPerSqKm: $DensityPerSqKm}';
  }
}
