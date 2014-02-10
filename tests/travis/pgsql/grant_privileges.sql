CREATE ROLE bareos WITH PASSWORD '';
CREATE USER bareos bareos;

-- For tables
GRANT ALL ON UnSavedFiles TO bareos;
GRANT ALL ON BaseFiles TO bareos;
GRANT ALL ON JobMedia TO bareos;
GRANT ALL ON File TO bareos;
GRANT ALL ON Job TO bareos;
GRANT ALL ON Media TO bareos;
GRANT ALL ON Client TO bareos;
GRANT ALL ON Pool TO bareos;
GRANT ALL ON Fileset TO bareos;
GRANT ALL ON Path TO bareos;
GRANT ALL ON Filename TO bareos;
GRANT ALL ON Counters TO bareos;
GRANT ALL ON Version TO bareos;
GRANT ALL ON CdImages TO bareos;
GRANT ALL ON MediaType TO bareos;
GRANT ALL ON Storage TO bareos;
GRANT ALL ON Device TO bareos;
GRANT ALL ON Status TO bareos;
GRANT ALL ON Location TO bareos;
GRANT ALL ON LocationLog TO bareos;
GRANT ALL ON Log TO bareos;
GRANT ALL ON JobHisto TO bareos;
GRANT ALL ON PathHierarchy TO bareos;
GRANT ALL ON PathVisibility TO bareos;
GRANT ALL ON RestoreObject TO bareos;
GRANT ALL ON Quota TO bareos;
GRANT ALL ON NDMPLevelMap TO bareos;
GRANT ALL ON NDMPJobEnvironment TO bareos;
GRANT ALL ON DeviceStats TO bareos;
GRANT ALL ON JobStats TO bareos;

-- For sequences ON those tables
GRANT SELECT, UPDATE ON filename_filenameid_seq TO bareos;
GRANT SELECT, UPDATE ON path_pathid_seq TO bareos;
GRANT SELECT, UPDATE ON fileset_filesetid_seq TO bareos;
GRANT SELECT, UPDATE ON pool_poolid_seq TO bareos;
GRANT SELECT, UPDATE ON client_clientid_seq TO bareos;
GRANT SELECT, UPDATE ON media_mediaid_seq TO bareos;
GRANT SELECT, UPDATE ON job_jobid_seq TO bareos;
GRANT SELECT, UPDATE ON file_fileid_seq TO bareos;
GRANT SELECT, UPDATE ON jobmedia_jobmediaid_seq TO bareos;
GRANT SELECT, UPDATE ON basefiles_baseid_seq TO bareos;
GRANT SELECT, UPDATE ON storage_storageid_seq TO bareos;
GRANT SELECT, UPDATE ON mediatype_mediatypeid_seq TO bareos;
GRANT SELECT, UPDATE ON device_deviceid_seq TO bareos;
GRANT SELECT, UPDATE ON location_locationid_seq TO bareos;
GRANT SELECT, UPDATE ON locationlog_loclogid_seq TO bareos;
GRANT SELECT, UPDATE ON log_logid_seq TO bareos;
GRANT SELECT, UPDATE ON restoreobject_restoreobjectid_seq TO bareos;
