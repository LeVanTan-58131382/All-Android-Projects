abstract class AppLocalStorageAbstract
{
  void init();

  Future<String> getCurrentValue();
  Future<bool> saveCurrentValue({ required String value});
  Future<bool> deleteCurrentValue();
}