class LocationData {
  int? statusCode;
  bool? feasibilityStatus;
  String? message;
  Data? data;

  LocationData(
      {this.statusCode, this.feasibilityStatus, this.message, this.data});

  LocationData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    feasibilityStatus = json['feasibilityStatus'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['feasibilityStatus'] =feasibilityStatus;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Result>? result;
  Pagination? pagination;

  Data({this.result, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add( Result.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ?  Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Result {
  String? sId;
  int? locationId;
  String? name;
  String? parkingType;
  String? email;
  int? phone;
  String? image;
  GeoLocation? geoLocation;
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? status;
  bool? isListed;
  ConnectionDetails? connectionDetails;
  OpeningHours? openingHours;
  String? organizationId;
  String? projectId;
  List<ChargerDetails>? chargerDetails;

  Result(
      {this.sId,
        this.locationId,
        this.name,
        this.parkingType,
        this.email,
        this.phone,
        this.image,
        this.geoLocation,
        this.street1,
        this.street2,
        this.city,
        this.state,
        this.country,
        this.zip,
        this.status,
        this.isListed,
        this.connectionDetails,
        this.openingHours,
        this.organizationId,
        this.projectId,
        this.chargerDetails});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    locationId = json['locationId'];
    name = json['name'];
    parkingType = json['parkingType'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    geoLocation = json['geoLocation'] != null
        ?  GeoLocation.fromJson(json['geoLocation'])
        : null;
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    status = json['status'];
    isListed = json['isListed'];
    connectionDetails = json['connectionDetails'] != null
        ?  ConnectionDetails.fromJson(json['connectionDetails'])
        : null;
    openingHours = json['openingHours'] != null
        ?  OpeningHours.fromJson(json['openingHours'])
        : null;
    organizationId = json['organizationId'];
    projectId = json['projectId'];
    if (json['chargerDetails'] != null) {
      chargerDetails = <ChargerDetails>[];
      json['chargerDetails'].forEach((v) {
        chargerDetails!.add( ChargerDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['locationId'] = locationId;
    data['name'] = name;
    data['parkingType'] = parkingType;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    if (this.geoLocation != null) {
      data['geoLocation'] = geoLocation!.toJson();
    }
    data['street1'] = street1;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['status'] = this.status;
    data['isListed'] = this.isListed;
    if (this.connectionDetails != null) {
      data['connectionDetails'] = this.connectionDetails!.toJson();
    }
    if (this.openingHours != null) {
      data['openingHours'] = this.openingHours!.toJson();
    }
    data['organizationId'] = this.organizationId;
    data['projectId'] = this.projectId;
    if (this.chargerDetails != null) {
      data['chargerDetails'] =
          this.chargerDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GeoLocation {
  String? type;
  List<double>? coordinates;

  GeoLocation({this.type, this.coordinates});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class ConnectionDetails {
  String? totalSanctionLoad;
  String? accountNumber;
  bool? isGreenEnergy;
  EnergySource? energySource;
  String? supplierType;
  String? sId;

  ConnectionDetails(
      {this.totalSanctionLoad,
        this.accountNumber,
        this.isGreenEnergy,
        this.energySource,
        this.supplierType,
        this.sId});

  ConnectionDetails.fromJson(Map<String, dynamic> json) {
    totalSanctionLoad = json['totalSanctionLoad'];
    accountNumber = json['accountNumber'];
    isGreenEnergy = json['isGreenEnergy'];
    energySource = json['energySource'] != null
        ?  EnergySource.fromJson(json['energySource'])
        : null;
    supplierType = json['supplierType'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['totalSanctionLoad'] = this.totalSanctionLoad;
    data['accountNumber'] = this.accountNumber;
    data['isGreenEnergy'] = this.isGreenEnergy;
    if (this.energySource != null) {
      data['energySource'] = this.energySource!.toJson();
    }
    data['supplierType'] = this.supplierType;
    data['_id'] = this.sId;
    return data;
  }
}

class EnergySource {
  String? source;
  int? percentage;

  EnergySource({this.source, this.percentage});

  EnergySource.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['source'] = this.source;
    data['percentage'] = this.percentage;
    return data;
  }
}

class OpeningHours {
  bool? isTwentyFourHours;
  String? sId;

  OpeningHours({this.isTwentyFourHours, this.sId});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    isTwentyFourHours = json['isTwentyFourHours'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['isTwentyFourHours'] = this.isTwentyFourHours;
    data['_id'] = this.sId;
    return data;
  }
}

class ChargerDetails {
  String? sId;
  String? identity;
  int? locationId;
  String? chargerName;
  String? chargePointOem;
  String? chargePointDevice;
  String? tarif;
  String? chargePointConnectionProtocol;
  List<String>? evse;
  String? floorLevel;
  bool? delStatus;
  String? organizationId;
  String? projectId;
  String? stationType;
  String? chargerType;
  String? chargerId;
  String? qrCode;
  String? maintenanceStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<EvsesDetails>? evsesDetails;
  bool? chargerStatus;

  ChargerDetails(
      {this.sId,
        this.identity,
        this.locationId,
        this.chargerName,
        this.chargePointOem,
        this.chargePointDevice,
        this.tarif,
        this.chargePointConnectionProtocol,
        this.evse,
        this.floorLevel,
        this.delStatus,
        this.organizationId,
        this.projectId,
        this.stationType,
        this.chargerType,
        this.chargerId,
        this.qrCode,
        this.maintenanceStatus,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.evsesDetails,
        this.chargerStatus});

  ChargerDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    identity = json['identity'];
    locationId = json['locationId'];
    chargerName = json['chargerName'];
    chargePointOem = json['chargePointOem'];
    chargePointDevice = json['chargePointDevice'];
    tarif = json['tarif'];
    chargePointConnectionProtocol = json['chargePointConnectionProtocol'];
    evse = json['evse'].cast<String>();
    floorLevel = json['floorLevel'];
    delStatus = json['delStatus'];
    organizationId = json['organizationId'];
    projectId = json['projectId'];
    stationType = json['stationType'];
    chargerType = json['chargerType'];
    chargerId = json['chargerId'];
    qrCode = json['qrCode'];
    maintenanceStatus = json['maintenanceStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['evsesDetails'] != null) {
      evsesDetails = <EvsesDetails>[];
      json['evsesDetails'].forEach((v) {
        evsesDetails!.add( EvsesDetails.fromJson(v));
      });
    }
    chargerStatus = json['chargerStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = this.sId;
    data['identity'] = this.identity;
    data['locationId'] = this.locationId;
    data['chargerName'] = this.chargerName;
    data['chargePointOem'] = this.chargePointOem;
    data['chargePointDevice'] = this.chargePointDevice;
    data['tarif'] = this.tarif;
    data['chargePointConnectionProtocol'] = this.chargePointConnectionProtocol;
    data['evse'] = this.evse;
    data['floorLevel'] = this.floorLevel;
    data['delStatus'] = this.delStatus;
    data['organizationId'] = this.organizationId;
    data['projectId'] = this.projectId;
    data['stationType'] = this.stationType;
    data['chargerType'] = this.chargerType;
    data['chargerId'] = this.chargerId;
    data['qrCode'] = this.qrCode;
    data['maintenanceStatus'] = this.maintenanceStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.evsesDetails != null) {
      data['evsesDetails'] = this.evsesDetails!.map((v) => v.toJson()).toList();
    }
    data['chargerStatus'] = this.chargerStatus;
    return data;
  }
}

class EvsesDetails {
  String? sId;
  String? physicalReference;
  String? uid;
  int? maxOutputPower;
  List<String>? capability;
  String? status;
  int? connectorId;
  List<String>? connector;
  String? organizationId;
  String? projectId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? connectorStatus;
  String? errorCode;
  String? availability;
  List<ConnectorDetails>? connectorDetails;

  EvsesDetails(
      {this.sId,
        this.physicalReference,
        this.uid,
        this.maxOutputPower,
        this.capability,
        this.status,
        this.connectorId,
        this.connector,
        this.organizationId,
        this.projectId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.connectorStatus,
        this.errorCode,
        this.availability,
        this.connectorDetails});

  EvsesDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    physicalReference = json['physicalReference'];
    uid = json['uid'];
    maxOutputPower = json['maxOutputPower'];
    capability = json['capability'].cast<String>();
    status = json['status'];
    connectorId = json['connectorId'];
    connector = json['connector'].cast<String>();
    organizationId = json['organizationId'];
    projectId = json['projectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    connectorStatus = json['connectorStatus'];
    errorCode = json['errorCode'];
    availability = json['Availability'];
    if (json['connectorDetails'] != null) {
      connectorDetails = <ConnectorDetails>[];
      json['connectorDetails'].forEach((v) {
        connectorDetails!.add( ConnectorDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = this.sId;
    data['physicalReference'] = this.physicalReference;
    data['uid'] = this.uid;
    data['maxOutputPower'] = this.maxOutputPower;
    data['capability'] = this.capability;
    data['status'] = this.status;
    data['connectorId'] = this.connectorId;
    data['connector'] = this.connector;
    data['organizationId'] = this.organizationId;
    data['projectId'] = this.projectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['connectorStatus'] = this.connectorStatus;
    data['errorCode'] = this.errorCode;
    data['Availability'] = this.availability;
    if (this.connectorDetails != null) {
      data['connectorDetails'] =
          this.connectorDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConnectorDetails {
  String? sId;
  String? name;
  Standard? standard;
  Format? format;
  PowerType? powerType;
  String? cmsId;
  int? maxVoltage;
  int? maxAmperage;
  int? maxElectricPower;
  String? termsConditionUrl;
  String? connectorImage;
  String? organizationId;
  String? projectId;

  ConnectorDetails(
      {this.sId,
        this.name,
        this.standard,
        this.format,
        this.powerType,
        this.cmsId,
        this.maxVoltage,
        this.maxAmperage,
        this.maxElectricPower,
        this.termsConditionUrl,
        this.connectorImage,
        this.organizationId,
        this.projectId});

  ConnectorDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    standard = json['standard'] != null
        ?  Standard.fromJson(json['standard'])
        : null;
    format =
    json['format'] != null ?  Format.fromJson(json['format']) : null;
    powerType = json['powerType'] != null
        ?  PowerType.fromJson(json['powerType'])
        : null;
    cmsId = json['cmsId'];
    maxVoltage = json['maxVoltage'];
    maxAmperage = json['maxAmperage'];
    maxElectricPower = json['maxElectricPower'];
    termsConditionUrl = json['termsConditionUrl'];
    connectorImage = json['connectorImage'];
    organizationId = json['organizationId'];
    projectId = json['projectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.standard != null) {
      data['standard'] = this.standard!.toJson();
    }
    if (this.format != null) {
      data['format'] = this.format!.toJson();
    }
    if (this.powerType != null) {
      data['powerType'] = this.powerType!.toJson();
    }
    data['cmsId'] = this.cmsId;
    data['maxVoltage'] = this.maxVoltage;
    data['maxAmperage'] = this.maxAmperage;
    data['maxElectricPower'] = this.maxElectricPower;
    data['termsConditionUrl'] = this.termsConditionUrl;
    data['connectorImage'] = this.connectorImage;
    data['organizationId'] = this.organizationId;
    data['projectId'] = this.projectId;
    return data;
  }
}

class Standard {
  String? standardName;

  Standard({this.standardName});

  Standard.fromJson(Map<String, dynamic> json) {
    standardName = json['standardName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['standardName'] = this.standardName;
    return data;
  }
}

class Format {
  String? formatName;

  Format({this.formatName});

  Format.fromJson(Map<String, dynamic> json) {
    formatName = json['formatName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['formatName'] = this.formatName;
    return data;
  }
}

class PowerType {
  String? powerType;

  PowerType({this.powerType});

  PowerType.fromJson(Map<String, dynamic> json) {
    powerType = json['powerType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['powerType'] = this.powerType;
    return data;
  }
}

class Pagination {
  int? totalRecord;
  int? currentPage;
  int? totalPages;
  int? perPage;

  Pagination(
      {this.totalRecord, this.currentPage, this.totalPages, this.perPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalRecord = json['totalRecord'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['totalRecord'] = this.totalRecord;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['perPage'] = this.perPage;
    return data;
  }
}