class PatientRecord {
  int _systolic = 0;
  int get systolic => _systolic;
  set systolic(int value) {
    _systolic = value;
  }

  int _diastolic = 0;
  int get diastolic => _diastolic;
  set diastolic(int value) {
    _diastolic = value;
  }

  int _bloodOxygenLevel = 0;
  int get bloodOxygenLevel => _bloodOxygenLevel;
  set bloodOxygenLevel(int value) {
    _bloodOxygenLevel = value;
  }

  int _respiratoryRate = 0;
  int get respiratoryRate => _respiratoryRate;
  set respiratoryRate(int value) {
    _respiratoryRate = value;
  }

  int _heartBeatRate = 0;
  int get heartBeatRate => _heartBeatRate;
  set heartBeatRate(int value) {
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