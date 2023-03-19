class PatientRecord {
  String _systolic = "";
  String get systolic => _systolic;
  set systolic(String value) {
    _systolic = value;
  }

  String _diastolic = "";
  String get diastolic => _diastolic;
  set diastolic(String value) {
    _diastolic = value;
  }

  String _bloodPressure = "";
  String get bloodPressure => _bloodPressure;
  set bloodPressure(String value) {
    _bloodPressure = value;
  }

  String _bloodOxygenLevel = "";
  String get bloodOxygenLevel => _bloodOxygenLevel;
  set bloodOxygenLevel(String value) {
    _bloodOxygenLevel = value;
  }

  String _respiratoryRate = "";
  String get respiratoryRate => _respiratoryRate;
  set respiratoryRate(String value) {
    _respiratoryRate = value;
  }

  String _heartBeatRate = "";
  String get heartBeatRate => _heartBeatRate;
  set heartBeatRate(String value) {
    _heartBeatRate = value;
  }

  String _clinicalDataLastUpdatedTime = "";
  String get clinicalDataLastUpdatedTime => _clinicalDataLastUpdatedTime;
  set clinicalDataLastUpdatedTime(String value) {
    _clinicalDataLastUpdatedTime = value;
  }

  PatientRecord.empty();

  PatientRecord(
      this._systolic,
      this._diastolic,
      this._bloodOxygenLevel,
      this._respiratoryRate,
      this._heartBeatRate,
      this._clinicalDataLastUpdatedTime);
}