// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisma_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentWhereInput _$DepartmentWhereInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => DepartmentWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => DepartmentWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => DepartmentWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFilter.fromJson(json['name'] as Map<String, dynamic>),
      employees: json['employees'] == null
          ? null
          : EmployeeListRelationFilter.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentWhereInputToJson(
    DepartmentWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

DepartmentOrderByWithRelationInput _$DepartmentOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
      employees: json['employees'] == null
          ? null
          : EmployeeOrderByRelationAggregateInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentOrderByWithRelationInputToJson(
    DepartmentOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};

DepartmentWhereUniqueInput _$DepartmentWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentWhereUniqueInput(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DepartmentWhereUniqueInputToJson(
    DepartmentWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

DepartmentOrderByWithAggregationInput
    _$DepartmentOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
          $count: json['_count'] == null
              ? null
              : DepartmentCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : DepartmentAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : DepartmentMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : DepartmentMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : DepartmentSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentOrderByWithAggregationInputToJson(
    DepartmentOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

DepartmentScalarWhereWithAggregatesInput
    _$DepartmentScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              DepartmentScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              DepartmentScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              DepartmentScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          name: json['name'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['name'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentScalarWhereWithAggregatesInputToJson(
    DepartmentScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  return val;
}

PersonWhereInput _$PersonWhereInputFromJson(Map<String, dynamic> json) =>
    PersonWhereInput(
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => PersonWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => PersonWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => PersonWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : StringFilter.fromJson(json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFilter.fromJson(json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : StringFilter.fromJson(json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? null
          : DateTimeFilter.fromJson(json['birthDate'] as Map<String, dynamic>),
      employees: json['employees'] == null
          ? null
          : EmployeeListRelationFilter.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonWhereInputToJson(PersonWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

PersonOrderByWithRelationInput _$PersonOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    PersonOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
      address: $enumDecodeNullable(_$SortOrderEnumMap, json['address']),
      birthDate: $enumDecodeNullable(_$SortOrderEnumMap, json['birthDate']),
      employees: json['employees'] == null
          ? null
          : EmployeeOrderByRelationAggregateInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonOrderByWithRelationInputToJson(
    PersonOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('address', _$SortOrderEnumMap[instance.address]);
  writeNotNull('birthDate', _$SortOrderEnumMap[instance.birthDate]);
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

PersonWhereUniqueInput _$PersonWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    PersonWhereUniqueInput(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PersonWhereUniqueInputToJson(
    PersonWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

PersonOrderByWithAggregationInput _$PersonOrderByWithAggregationInputFromJson(
        Map<String, dynamic> json) =>
    PersonOrderByWithAggregationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
      address: $enumDecodeNullable(_$SortOrderEnumMap, json['address']),
      birthDate: $enumDecodeNullable(_$SortOrderEnumMap, json['birthDate']),
      $count: json['_count'] == null
          ? null
          : PersonCountOrderByAggregateInput.fromJson(
              json['_count'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : PersonMaxOrderByAggregateInput.fromJson(
              json['_max'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : PersonMinOrderByAggregateInput.fromJson(
              json['_min'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonOrderByWithAggregationInputToJson(
    PersonOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('address', _$SortOrderEnumMap[instance.address]);
  writeNotNull('birthDate', _$SortOrderEnumMap[instance.birthDate]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  return val;
}

PersonScalarWhereWithAggregatesInput
    _$PersonScalarWhereWithAggregatesInputFromJson(Map<String, dynamic> json) =>
        PersonScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              PersonScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              PersonScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              PersonScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          name: json['name'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['name'] as Map<String, dynamic>),
          address: json['address'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['address'] as Map<String, dynamic>),
          birthDate: json['birthDate'] == null
              ? null
              : DateTimeWithAggregatesFilter.fromJson(
                  json['birthDate'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PersonScalarWhereWithAggregatesInputToJson(
    PersonScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  return val;
}

EmployeeWhereInput _$EmployeeWhereInputFromJson(Map<String, dynamic> json) =>
    EmployeeWhereInput(
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => EmployeeWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => EmployeeWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => EmployeeWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : StringFilter.fromJson(json['id'] as Map<String, dynamic>),
      departmentId: json['departmentId'] == null
          ? null
          : IntFilter.fromJson(json['departmentId'] as Map<String, dynamic>),
      personId: json['personId'] == null
          ? null
          : StringFilter.fromJson(json['personId'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFilter.fromJson(json['position'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : DepartmentRelationFilter.fromJson(
              json['department'] as Map<String, dynamic>),
      person: json['person'] == null
          ? null
          : PersonRelationFilter.fromJson(
              json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeWhereInputToJson(EmployeeWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('departmentId', instance.departmentId?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('department', instance.department?.toJson());
  writeNotNull('person', instance.person?.toJson());
  return val;
}

EmployeeOrderByWithRelationInput _$EmployeeOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      departmentId:
          $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
      personId: $enumDecodeNullable(_$SortOrderEnumMap, json['personId']),
      position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
      department: json['department'] == null
          ? null
          : DepartmentOrderByWithRelationInput.fromJson(
              json['department'] as Map<String, dynamic>),
      person: json['person'] == null
          ? null
          : PersonOrderByWithRelationInput.fromJson(
              json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeOrderByWithRelationInputToJson(
    EmployeeOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('personId', _$SortOrderEnumMap[instance.personId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  writeNotNull('department', instance.department?.toJson());
  writeNotNull('person', instance.person?.toJson());
  return val;
}

EmployeeWhereUniqueInput _$EmployeeWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeWhereUniqueInput(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$EmployeeWhereUniqueInputToJson(
    EmployeeWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

EmployeeOrderByWithAggregationInput
    _$EmployeeOrderByWithAggregationInputFromJson(Map<String, dynamic> json) =>
        EmployeeOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          departmentId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
          personId: $enumDecodeNullable(_$SortOrderEnumMap, json['personId']),
          position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
          $count: json['_count'] == null
              ? null
              : EmployeeCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : EmployeeAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : EmployeeMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : EmployeeMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : EmployeeSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeOrderByWithAggregationInputToJson(
    EmployeeOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('personId', _$SortOrderEnumMap[instance.personId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

EmployeeScalarWhereWithAggregatesInput
    _$EmployeeScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          departmentId: json['departmentId'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['departmentId'] as Map<String, dynamic>),
          personId: json['personId'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['personId'] as Map<String, dynamic>),
          position: json['position'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['position'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeScalarWhereWithAggregatesInputToJson(
    EmployeeScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('departmentId', instance.departmentId?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

DepartmentCreateInput _$DepartmentCreateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentCreateInput(
      name: json['name'] as String,
      employees: json['employees'] == null
          ? null
          : EmployeeCreateNestedManyWithoutDepartmentInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentCreateInputToJson(
    DepartmentCreateInput instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

DepartmentUncheckedCreateInput _$DepartmentUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentUncheckedCreateInput(
      id: json['id'] as int?,
      name: json['name'] as String,
      employees: json['employees'] == null
          ? null
          : EmployeeUncheckedCreateNestedManyWithoutDepartmentInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentUncheckedCreateInputToJson(
    DepartmentUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

DepartmentUpdateInput _$DepartmentUpdateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentUpdateInput(
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      employees: json['employees'] == null
          ? null
          : EmployeeUpdateManyWithoutDepartmentNestedInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentUpdateInputToJson(
    DepartmentUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name?.toJson());
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

DepartmentUncheckedUpdateInput _$DepartmentUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      employees: json['employees'] == null
          ? null
          : EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentUncheckedUpdateInputToJson(
    DepartmentUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

DepartmentUpdateManyMutationInput _$DepartmentUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentUpdateManyMutationInput(
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentUpdateManyMutationInputToJson(
    DepartmentUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name?.toJson());
  return val;
}

DepartmentUncheckedUpdateManyInput _$DepartmentUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentUncheckedUpdateManyInputToJson(
    DepartmentUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  return val;
}

PersonCreateInput _$PersonCreateInputFromJson(Map<String, dynamic> json) =>
    PersonCreateInput(
      id: json['id'] as String?,
      name: json['name'] as String,
      address: json['address'] as String,
      birthDate:
          const DateTimeJsonConverter().fromJson(json['birthDate'] as String),
      employees: json['employees'] == null
          ? null
          : EmployeeCreateNestedManyWithoutPersonInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonCreateInputToJson(PersonCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['address'] = instance.address;
  val['birthDate'] = const DateTimeJsonConverter().toJson(instance.birthDate);
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

PersonUncheckedCreateInput _$PersonUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    PersonUncheckedCreateInput(
      id: json['id'] as String?,
      name: json['name'] as String,
      address: json['address'] as String,
      birthDate:
          const DateTimeJsonConverter().fromJson(json['birthDate'] as String),
      employees: json['employees'] == null
          ? null
          : EmployeeUncheckedCreateNestedManyWithoutPersonInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUncheckedCreateInputToJson(
    PersonUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['address'] = instance.address;
  val['birthDate'] = const DateTimeJsonConverter().toJson(instance.birthDate);
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

PersonUpdateInput _$PersonUpdateInputFromJson(Map<String, dynamic> json) =>
    PersonUpdateInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? null
          : DateTimeFieldUpdateOperationsInput.fromJson(
              json['birthDate'] as Map<String, dynamic>),
      employees: json['employees'] == null
          ? null
          : EmployeeUpdateManyWithoutPersonNestedInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUpdateInputToJson(PersonUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

PersonUncheckedUpdateInput _$PersonUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    PersonUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? null
          : DateTimeFieldUpdateOperationsInput.fromJson(
              json['birthDate'] as Map<String, dynamic>),
      employees: json['employees'] == null
          ? null
          : EmployeeUncheckedUpdateManyWithoutPersonNestedInput.fromJson(
              json['employees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUncheckedUpdateInputToJson(
    PersonUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  writeNotNull('employees', instance.employees?.toJson());
  return val;
}

PersonUpdateManyMutationInput _$PersonUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    PersonUpdateManyMutationInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? null
          : DateTimeFieldUpdateOperationsInput.fromJson(
              json['birthDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUpdateManyMutationInputToJson(
    PersonUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  return val;
}

PersonUncheckedUpdateManyInput _$PersonUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    PersonUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? null
          : DateTimeFieldUpdateOperationsInput.fromJson(
              json['birthDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUncheckedUpdateManyInputToJson(
    PersonUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  return val;
}

EmployeeCreateInput _$EmployeeCreateInputFromJson(Map<String, dynamic> json) =>
    EmployeeCreateInput(
      id: json['id'] as String?,
      position: json['position'] as int,
      department: DepartmentCreateNestedOneWithoutEmployeesInput.fromJson(
          json['department'] as Map<String, dynamic>),
      person: PersonCreateNestedOneWithoutEmployeesInput.fromJson(
          json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeCreateInputToJson(EmployeeCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['position'] = instance.position;
  val['department'] = instance.department.toJson();
  val['person'] = instance.person.toJson();
  return val;
}

EmployeeUncheckedCreateInput _$EmployeeUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeUncheckedCreateInput(
      id: json['id'] as String?,
      departmentId: json['departmentId'] as int,
      personId: json['personId'] as String,
      position: json['position'] as int,
    );

Map<String, dynamic> _$EmployeeUncheckedCreateInputToJson(
    EmployeeUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['departmentId'] = instance.departmentId;
  val['personId'] = instance.personId;
  val['position'] = instance.position;
  return val;
}

EmployeeUpdateInput _$EmployeeUpdateInputFromJson(Map<String, dynamic> json) =>
    EmployeeUpdateInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['position'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : DepartmentUpdateOneRequiredWithoutEmployeesNestedInput.fromJson(
              json['department'] as Map<String, dynamic>),
      person: json['person'] == null
          ? null
          : PersonUpdateOneRequiredWithoutEmployeesNestedInput.fromJson(
              json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeUpdateInputToJson(EmployeeUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('department', instance.department?.toJson());
  writeNotNull('person', instance.person?.toJson());
  return val;
}

EmployeeUncheckedUpdateInput _$EmployeeUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      departmentId: json['departmentId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['departmentId'] as Map<String, dynamic>),
      personId: json['personId'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['personId'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeUncheckedUpdateInputToJson(
    EmployeeUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('departmentId', instance.departmentId?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

EmployeeUpdateManyMutationInput _$EmployeeUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeUpdateManyMutationInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeUpdateManyMutationInputToJson(
    EmployeeUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

EmployeeUncheckedUpdateManyInput _$EmployeeUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      departmentId: json['departmentId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['departmentId'] as Map<String, dynamic>),
      personId: json['personId'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['personId'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeUncheckedUpdateManyInputToJson(
    EmployeeUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('departmentId', instance.departmentId?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

IntFilter _$IntFilterFromJson(Map<String, dynamic> json) => IntFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntFilterToJson(IntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) => StringFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

EmployeeListRelationFilter _$EmployeeListRelationFilterFromJson(
        Map<String, dynamic> json) =>
    EmployeeListRelationFilter(
      every: json['every'] == null
          ? null
          : EmployeeWhereInput.fromJson(json['every'] as Map<String, dynamic>),
      some: json['some'] == null
          ? null
          : EmployeeWhereInput.fromJson(json['some'] as Map<String, dynamic>),
      none: json['none'] == null
          ? null
          : EmployeeWhereInput.fromJson(json['none'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeListRelationFilterToJson(
    EmployeeListRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('every', instance.every?.toJson());
  writeNotNull('some', instance.some?.toJson());
  writeNotNull('none', instance.none?.toJson());
  return val;
}

EmployeeOrderByRelationAggregateInput
    _$EmployeeOrderByRelationAggregateInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeOrderByRelationAggregateInput(
          $count: $enumDecodeNullable(_$SortOrderEnumMap, json['_count']),
        );

Map<String, dynamic> _$EmployeeOrderByRelationAggregateInputToJson(
    EmployeeOrderByRelationAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_count', _$SortOrderEnumMap[instance.$count]);
  return val;
}

DepartmentCountOrderByAggregateInput
    _$DepartmentCountOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        DepartmentCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
        );

Map<String, dynamic> _$DepartmentCountOrderByAggregateInputToJson(
    DepartmentCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  return val;
}

DepartmentAvgOrderByAggregateInput _$DepartmentAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$DepartmentAvgOrderByAggregateInputToJson(
    DepartmentAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

DepartmentMaxOrderByAggregateInput _$DepartmentMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
    );

Map<String, dynamic> _$DepartmentMaxOrderByAggregateInputToJson(
    DepartmentMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  return val;
}

DepartmentMinOrderByAggregateInput _$DepartmentMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
    );

Map<String, dynamic> _$DepartmentMinOrderByAggregateInputToJson(
    DepartmentMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  return val;
}

DepartmentSumOrderByAggregateInput _$DepartmentSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    DepartmentSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$DepartmentSumOrderByAggregateInputToJson(
    DepartmentSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

IntWithAggregatesFilter _$IntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    IntWithAggregatesFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntWithAggregatesFilterToJson(
    IntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

StringWithAggregatesFilter _$StringWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    StringWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringWithAggregatesFilterToJson(
    StringWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

DateTimeFilter _$DateTimeFilterFromJson(Map<String, dynamic> json) =>
    DateTimeFilter(
      equals: _$JsonConverterFromJson<String, DateTime>(
          json['equals'], const DateTimeJsonConverter().fromJson),
      $in: (json['in'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      lt: _$JsonConverterFromJson<String, DateTime>(
          json['lt'], const DateTimeJsonConverter().fromJson),
      lte: _$JsonConverterFromJson<String, DateTime>(
          json['lte'], const DateTimeJsonConverter().fromJson),
      gt: _$JsonConverterFromJson<String, DateTime>(
          json['gt'], const DateTimeJsonConverter().fromJson),
      gte: _$JsonConverterFromJson<String, DateTime>(
          json['gte'], const DateTimeJsonConverter().fromJson),
      not: json['not'] == null
          ? null
          : NestedDateTimeFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateTimeFilterToJson(DateTimeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'equals',
      _$JsonConverterToJson<String, DateTime>(
          instance.equals, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'in', instance.$in?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull('notIn',
      instance.notIn?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull(
      'lt',
      _$JsonConverterToJson<String, DateTime>(
          instance.lt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'lte',
      _$JsonConverterToJson<String, DateTime>(
          instance.lte, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gt',
      _$JsonConverterToJson<String, DateTime>(
          instance.gt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gte',
      _$JsonConverterToJson<String, DateTime>(
          instance.gte, const DateTimeJsonConverter().toJson));
  writeNotNull('not', instance.not?.toJson());
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

PersonCountOrderByAggregateInput _$PersonCountOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PersonCountOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
      address: $enumDecodeNullable(_$SortOrderEnumMap, json['address']),
      birthDate: $enumDecodeNullable(_$SortOrderEnumMap, json['birthDate']),
    );

Map<String, dynamic> _$PersonCountOrderByAggregateInputToJson(
    PersonCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('address', _$SortOrderEnumMap[instance.address]);
  writeNotNull('birthDate', _$SortOrderEnumMap[instance.birthDate]);
  return val;
}

PersonMaxOrderByAggregateInput _$PersonMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PersonMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
      address: $enumDecodeNullable(_$SortOrderEnumMap, json['address']),
      birthDate: $enumDecodeNullable(_$SortOrderEnumMap, json['birthDate']),
    );

Map<String, dynamic> _$PersonMaxOrderByAggregateInputToJson(
    PersonMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('address', _$SortOrderEnumMap[instance.address]);
  writeNotNull('birthDate', _$SortOrderEnumMap[instance.birthDate]);
  return val;
}

PersonMinOrderByAggregateInput _$PersonMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PersonMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      name: $enumDecodeNullable(_$SortOrderEnumMap, json['name']),
      address: $enumDecodeNullable(_$SortOrderEnumMap, json['address']),
      birthDate: $enumDecodeNullable(_$SortOrderEnumMap, json['birthDate']),
    );

Map<String, dynamic> _$PersonMinOrderByAggregateInputToJson(
    PersonMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('name', _$SortOrderEnumMap[instance.name]);
  writeNotNull('address', _$SortOrderEnumMap[instance.address]);
  writeNotNull('birthDate', _$SortOrderEnumMap[instance.birthDate]);
  return val;
}

DateTimeWithAggregatesFilter _$DateTimeWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    DateTimeWithAggregatesFilter(
      equals: _$JsonConverterFromJson<String, DateTime>(
          json['equals'], const DateTimeJsonConverter().fromJson),
      $in: (json['in'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      lt: _$JsonConverterFromJson<String, DateTime>(
          json['lt'], const DateTimeJsonConverter().fromJson),
      lte: _$JsonConverterFromJson<String, DateTime>(
          json['lte'], const DateTimeJsonConverter().fromJson),
      gt: _$JsonConverterFromJson<String, DateTime>(
          json['gt'], const DateTimeJsonConverter().fromJson),
      gte: _$JsonConverterFromJson<String, DateTime>(
          json['gte'], const DateTimeJsonConverter().fromJson),
      not: json['not'] == null
          ? null
          : NestedDateTimeWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedDateTimeFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedDateTimeFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateTimeWithAggregatesFilterToJson(
    DateTimeWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'equals',
      _$JsonConverterToJson<String, DateTime>(
          instance.equals, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'in', instance.$in?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull('notIn',
      instance.notIn?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull(
      'lt',
      _$JsonConverterToJson<String, DateTime>(
          instance.lt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'lte',
      _$JsonConverterToJson<String, DateTime>(
          instance.lte, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gt',
      _$JsonConverterToJson<String, DateTime>(
          instance.gt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gte',
      _$JsonConverterToJson<String, DateTime>(
          instance.gte, const DateTimeJsonConverter().toJson));
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

DepartmentRelationFilter _$DepartmentRelationFilterFromJson(
        Map<String, dynamic> json) =>
    DepartmentRelationFilter(
      $is: json['is'] == null
          ? null
          : DepartmentWhereInput.fromJson(json['is'] as Map<String, dynamic>),
      isNot: json['isNot'] == null
          ? null
          : DepartmentWhereInput.fromJson(
              json['isNot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentRelationFilterToJson(
    DepartmentRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is', instance.$is?.toJson());
  writeNotNull('isNot', instance.isNot?.toJson());
  return val;
}

PersonRelationFilter _$PersonRelationFilterFromJson(
        Map<String, dynamic> json) =>
    PersonRelationFilter(
      $is: json['is'] == null
          ? null
          : PersonWhereInput.fromJson(json['is'] as Map<String, dynamic>),
      isNot: json['isNot'] == null
          ? null
          : PersonWhereInput.fromJson(json['isNot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonRelationFilterToJson(
    PersonRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is', instance.$is?.toJson());
  writeNotNull('isNot', instance.isNot?.toJson());
  return val;
}

EmployeeCountOrderByAggregateInput _$EmployeeCountOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeCountOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      departmentId:
          $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
      personId: $enumDecodeNullable(_$SortOrderEnumMap, json['personId']),
      position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
    );

Map<String, dynamic> _$EmployeeCountOrderByAggregateInputToJson(
    EmployeeCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('personId', _$SortOrderEnumMap[instance.personId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  return val;
}

EmployeeAvgOrderByAggregateInput _$EmployeeAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeAvgOrderByAggregateInput(
      departmentId:
          $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
      position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
    );

Map<String, dynamic> _$EmployeeAvgOrderByAggregateInputToJson(
    EmployeeAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  return val;
}

EmployeeMaxOrderByAggregateInput _$EmployeeMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      departmentId:
          $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
      personId: $enumDecodeNullable(_$SortOrderEnumMap, json['personId']),
      position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
    );

Map<String, dynamic> _$EmployeeMaxOrderByAggregateInputToJson(
    EmployeeMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('personId', _$SortOrderEnumMap[instance.personId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  return val;
}

EmployeeMinOrderByAggregateInput _$EmployeeMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      departmentId:
          $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
      personId: $enumDecodeNullable(_$SortOrderEnumMap, json['personId']),
      position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
    );

Map<String, dynamic> _$EmployeeMinOrderByAggregateInputToJson(
    EmployeeMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('personId', _$SortOrderEnumMap[instance.personId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  return val;
}

EmployeeSumOrderByAggregateInput _$EmployeeSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeSumOrderByAggregateInput(
      departmentId:
          $enumDecodeNullable(_$SortOrderEnumMap, json['departmentId']),
      position: $enumDecodeNullable(_$SortOrderEnumMap, json['position']),
    );

Map<String, dynamic> _$EmployeeSumOrderByAggregateInputToJson(
    EmployeeSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('departmentId', _$SortOrderEnumMap[instance.departmentId]);
  writeNotNull('position', _$SortOrderEnumMap[instance.position]);
  return val;
}

EmployeeCreateNestedManyWithoutDepartmentInput
    _$EmployeeCreateNestedManyWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeCreateNestedManyWithoutDepartmentInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$EmployeeCreateNestedManyWithoutDepartmentInputToJson(
    EmployeeCreateNestedManyWithoutDepartmentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

EmployeeUncheckedCreateNestedManyWithoutDepartmentInput
    _$EmployeeUncheckedCreateNestedManyWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedCreateNestedManyWithoutDepartmentInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$EmployeeUncheckedCreateNestedManyWithoutDepartmentInputToJson(
        EmployeeUncheckedCreateNestedManyWithoutDepartmentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

StringFieldUpdateOperationsInput _$StringFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    StringFieldUpdateOperationsInput(
      set: json['set'] as String?,
    );

Map<String, dynamic> _$StringFieldUpdateOperationsInputToJson(
    StringFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  return val;
}

EmployeeUpdateManyWithoutDepartmentNestedInput
    _$EmployeeUpdateManyWithoutDepartmentNestedInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpdateManyWithoutDepartmentNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              EmployeeUpsertWithWhereUniqueWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateWithWhereUniqueWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateManyWithWhereWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$EmployeeUpdateManyWithoutDepartmentNestedInputToJson(
    EmployeeUpdateManyWithoutDepartmentNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

IntFieldUpdateOperationsInput _$IntFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    IntFieldUpdateOperationsInput(
      set: json['set'] as int?,
      increment: json['increment'] as int?,
      decrement: json['decrement'] as int?,
      multiply: json['multiply'] as int?,
      divide: json['divide'] as int?,
    );

Map<String, dynamic> _$IntFieldUpdateOperationsInputToJson(
    IntFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  writeNotNull('increment', instance.increment);
  writeNotNull('decrement', instance.decrement);
  writeNotNull('multiply', instance.multiply);
  writeNotNull('divide', instance.divide);
  return val;
}

EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput
    _$EmployeeUncheckedUpdateManyWithoutDepartmentNestedInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              EmployeeUpsertWithWhereUniqueWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateWithWhereUniqueWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateManyWithWhereWithoutDepartmentInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$EmployeeUncheckedUpdateManyWithoutDepartmentNestedInputToJson(
        EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

EmployeeCreateNestedManyWithoutPersonInput
    _$EmployeeCreateNestedManyWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeCreateNestedManyWithoutPersonInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$EmployeeCreateNestedManyWithoutPersonInputToJson(
    EmployeeCreateNestedManyWithoutPersonInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

EmployeeUncheckedCreateNestedManyWithoutPersonInput
    _$EmployeeUncheckedCreateNestedManyWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedCreateNestedManyWithoutPersonInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$EmployeeUncheckedCreateNestedManyWithoutPersonInputToJson(
        EmployeeUncheckedCreateNestedManyWithoutPersonInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

DateTimeFieldUpdateOperationsInput _$DateTimeFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    DateTimeFieldUpdateOperationsInput(
      set: _$JsonConverterFromJson<String, DateTime>(
          json['set'], const DateTimeJsonConverter().fromJson),
    );

Map<String, dynamic> _$DateTimeFieldUpdateOperationsInputToJson(
    DateTimeFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'set',
      _$JsonConverterToJson<String, DateTime>(
          instance.set, const DateTimeJsonConverter().toJson));
  return val;
}

EmployeeUpdateManyWithoutPersonNestedInput
    _$EmployeeUpdateManyWithoutPersonNestedInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpdateManyWithoutPersonNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              EmployeeUpsertWithWhereUniqueWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateWithWhereUniqueWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateManyWithWhereWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$EmployeeUpdateManyWithoutPersonNestedInputToJson(
    EmployeeUpdateManyWithoutPersonNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

EmployeeUncheckedUpdateManyWithoutPersonNestedInput
    _$EmployeeUncheckedUpdateManyWithoutPersonNestedInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedUpdateManyWithoutPersonNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              EmployeeCreateWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => EmployeeCreateOrConnectWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              EmployeeUpsertWithWhereUniqueWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              EmployeeWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateWithWhereUniqueWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              EmployeeUpdateManyWithWhereWithoutPersonInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$EmployeeUncheckedUpdateManyWithoutPersonNestedInputToJson(
        EmployeeUncheckedUpdateManyWithoutPersonNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

DepartmentCreateNestedOneWithoutEmployeesInput
    _$DepartmentCreateNestedOneWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentCreateNestedOneWithoutEmployeesInput(
          create: json['create'] == null
              ? null
              : DepartmentCreateWithoutEmployeesInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : DepartmentCreateOrConnectWithoutEmployeesInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : DepartmentWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentCreateNestedOneWithoutEmployeesInputToJson(
    DepartmentCreateNestedOneWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  return val;
}

PersonCreateNestedOneWithoutEmployeesInput
    _$PersonCreateNestedOneWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        PersonCreateNestedOneWithoutEmployeesInput(
          create: json['create'] == null
              ? null
              : PersonCreateWithoutEmployeesInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : PersonCreateOrConnectWithoutEmployeesInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : PersonWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PersonCreateNestedOneWithoutEmployeesInputToJson(
    PersonCreateNestedOneWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  return val;
}

DepartmentUpdateOneRequiredWithoutEmployeesNestedInput
    _$DepartmentUpdateOneRequiredWithoutEmployeesNestedInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentUpdateOneRequiredWithoutEmployeesNestedInput(
          create: json['create'] == null
              ? null
              : DepartmentCreateWithoutEmployeesInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : DepartmentCreateOrConnectWithoutEmployeesInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          upsert: json['upsert'] == null
              ? null
              : DepartmentUpsertWithoutEmployeesInput.fromJson(
                  json['upsert'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : DepartmentWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
          update: json['update'] == null
              ? null
              : DepartmentUpdateWithoutEmployeesInput.fromJson(
                  json['update'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$DepartmentUpdateOneRequiredWithoutEmployeesNestedInputToJson(
        DepartmentUpdateOneRequiredWithoutEmployeesNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('upsert', instance.upsert?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  writeNotNull('update', instance.update?.toJson());
  return val;
}

PersonUpdateOneRequiredWithoutEmployeesNestedInput
    _$PersonUpdateOneRequiredWithoutEmployeesNestedInputFromJson(
            Map<String, dynamic> json) =>
        PersonUpdateOneRequiredWithoutEmployeesNestedInput(
          create: json['create'] == null
              ? null
              : PersonCreateWithoutEmployeesInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : PersonCreateOrConnectWithoutEmployeesInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          upsert: json['upsert'] == null
              ? null
              : PersonUpsertWithoutEmployeesInput.fromJson(
                  json['upsert'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : PersonWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
          update: json['update'] == null
              ? null
              : PersonUpdateWithoutEmployeesInput.fromJson(
                  json['update'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PersonUpdateOneRequiredWithoutEmployeesNestedInputToJson(
    PersonUpdateOneRequiredWithoutEmployeesNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('upsert', instance.upsert?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  writeNotNull('update', instance.update?.toJson());
  return val;
}

NestedIntFilter _$NestedIntFilterFromJson(Map<String, dynamic> json) =>
    NestedIntFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntFilterToJson(NestedIntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringFilter _$NestedStringFilterFromJson(Map<String, dynamic> json) =>
    NestedStringFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringFilterToJson(NestedStringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedIntWithAggregatesFilter _$NestedIntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedIntWithAggregatesFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntWithAggregatesFilterToJson(
    NestedIntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedFloatFilter _$NestedFloatFilterFromJson(Map<String, dynamic> json) =>
    NestedFloatFilter(
      equals: (json['equals'] as num?)?.toDouble(),
      $in: (json['in'] as List<dynamic>?)?.map((e) => (e as num).toDouble()),
      notIn:
          (json['notIn'] as List<dynamic>?)?.map((e) => (e as num).toDouble()),
      lt: (json['lt'] as num?)?.toDouble(),
      lte: (json['lte'] as num?)?.toDouble(),
      gt: (json['gt'] as num?)?.toDouble(),
      gte: (json['gte'] as num?)?.toDouble(),
      not: json['not'] == null
          ? null
          : NestedFloatFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedFloatFilterToJson(NestedFloatFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringWithAggregatesFilter _$NestedStringWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedStringWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringWithAggregatesFilterToJson(
    NestedStringWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedDateTimeFilter _$NestedDateTimeFilterFromJson(
        Map<String, dynamic> json) =>
    NestedDateTimeFilter(
      equals: _$JsonConverterFromJson<String, DateTime>(
          json['equals'], const DateTimeJsonConverter().fromJson),
      $in: (json['in'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      lt: _$JsonConverterFromJson<String, DateTime>(
          json['lt'], const DateTimeJsonConverter().fromJson),
      lte: _$JsonConverterFromJson<String, DateTime>(
          json['lte'], const DateTimeJsonConverter().fromJson),
      gt: _$JsonConverterFromJson<String, DateTime>(
          json['gt'], const DateTimeJsonConverter().fromJson),
      gte: _$JsonConverterFromJson<String, DateTime>(
          json['gte'], const DateTimeJsonConverter().fromJson),
      not: json['not'] == null
          ? null
          : NestedDateTimeFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedDateTimeFilterToJson(
    NestedDateTimeFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'equals',
      _$JsonConverterToJson<String, DateTime>(
          instance.equals, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'in', instance.$in?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull('notIn',
      instance.notIn?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull(
      'lt',
      _$JsonConverterToJson<String, DateTime>(
          instance.lt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'lte',
      _$JsonConverterToJson<String, DateTime>(
          instance.lte, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gt',
      _$JsonConverterToJson<String, DateTime>(
          instance.gt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gte',
      _$JsonConverterToJson<String, DateTime>(
          instance.gte, const DateTimeJsonConverter().toJson));
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedDateTimeWithAggregatesFilter _$NestedDateTimeWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedDateTimeWithAggregatesFilter(
      equals: _$JsonConverterFromJson<String, DateTime>(
          json['equals'], const DateTimeJsonConverter().fromJson),
      $in: (json['in'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => const DateTimeJsonConverter().fromJson(e as String)),
      lt: _$JsonConverterFromJson<String, DateTime>(
          json['lt'], const DateTimeJsonConverter().fromJson),
      lte: _$JsonConverterFromJson<String, DateTime>(
          json['lte'], const DateTimeJsonConverter().fromJson),
      gt: _$JsonConverterFromJson<String, DateTime>(
          json['gt'], const DateTimeJsonConverter().fromJson),
      gte: _$JsonConverterFromJson<String, DateTime>(
          json['gte'], const DateTimeJsonConverter().fromJson),
      not: json['not'] == null
          ? null
          : NestedDateTimeWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedDateTimeFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedDateTimeFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedDateTimeWithAggregatesFilterToJson(
    NestedDateTimeWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'equals',
      _$JsonConverterToJson<String, DateTime>(
          instance.equals, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'in', instance.$in?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull('notIn',
      instance.notIn?.map(const DateTimeJsonConverter().toJson).toList());
  writeNotNull(
      'lt',
      _$JsonConverterToJson<String, DateTime>(
          instance.lt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'lte',
      _$JsonConverterToJson<String, DateTime>(
          instance.lte, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gt',
      _$JsonConverterToJson<String, DateTime>(
          instance.gt, const DateTimeJsonConverter().toJson));
  writeNotNull(
      'gte',
      _$JsonConverterToJson<String, DateTime>(
          instance.gte, const DateTimeJsonConverter().toJson));
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

EmployeeCreateWithoutDepartmentInput
    _$EmployeeCreateWithoutDepartmentInputFromJson(Map<String, dynamic> json) =>
        EmployeeCreateWithoutDepartmentInput(
          id: json['id'] as String?,
          position: json['position'] as int,
          person: PersonCreateNestedOneWithoutEmployeesInput.fromJson(
              json['person'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeCreateWithoutDepartmentInputToJson(
    EmployeeCreateWithoutDepartmentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['position'] = instance.position;
  val['person'] = instance.person.toJson();
  return val;
}

EmployeeUncheckedCreateWithoutDepartmentInput
    _$EmployeeUncheckedCreateWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedCreateWithoutDepartmentInput(
          id: json['id'] as String?,
          personId: json['personId'] as String,
          position: json['position'] as int,
        );

Map<String, dynamic> _$EmployeeUncheckedCreateWithoutDepartmentInputToJson(
    EmployeeUncheckedCreateWithoutDepartmentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['personId'] = instance.personId;
  val['position'] = instance.position;
  return val;
}

EmployeeCreateOrConnectWithoutDepartmentInput
    _$EmployeeCreateOrConnectWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeCreateOrConnectWithoutDepartmentInput(
          where: EmployeeWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: EmployeeCreateWithoutDepartmentInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeCreateOrConnectWithoutDepartmentInputToJson(
        EmployeeCreateOrConnectWithoutDepartmentInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

EmployeeUpsertWithWhereUniqueWithoutDepartmentInput
    _$EmployeeUpsertWithWhereUniqueWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpsertWithWhereUniqueWithoutDepartmentInput(
          where: EmployeeWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          update: EmployeeUpdateWithoutDepartmentInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: EmployeeCreateWithoutDepartmentInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$EmployeeUpsertWithWhereUniqueWithoutDepartmentInputToJson(
            EmployeeUpsertWithWhereUniqueWithoutDepartmentInput instance) =>
        <String, dynamic>{
          'where': instance.where.toJson(),
          'update': instance.update.toJson(),
          'create': instance.create.toJson(),
        };

EmployeeUpdateWithWhereUniqueWithoutDepartmentInput
    _$EmployeeUpdateWithWhereUniqueWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpdateWithWhereUniqueWithoutDepartmentInput(
          where: EmployeeWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: EmployeeUpdateWithoutDepartmentInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$EmployeeUpdateWithWhereUniqueWithoutDepartmentInputToJson(
            EmployeeUpdateWithWhereUniqueWithoutDepartmentInput instance) =>
        <String, dynamic>{
          'where': instance.where.toJson(),
          'data': instance.data.toJson(),
        };

EmployeeUpdateManyWithWhereWithoutDepartmentInput
    _$EmployeeUpdateManyWithWhereWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpdateManyWithWhereWithoutDepartmentInput(
          where: EmployeeScalarWhereInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: EmployeeUpdateManyMutationInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUpdateManyWithWhereWithoutDepartmentInputToJson(
        EmployeeUpdateManyWithWhereWithoutDepartmentInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

EmployeeScalarWhereInput _$EmployeeScalarWhereInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeScalarWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => EmployeeScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : StringFilter.fromJson(json['id'] as Map<String, dynamic>),
      departmentId: json['departmentId'] == null
          ? null
          : IntFilter.fromJson(json['departmentId'] as Map<String, dynamic>),
      personId: json['personId'] == null
          ? null
          : StringFilter.fromJson(json['personId'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFilter.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeScalarWhereInputToJson(
    EmployeeScalarWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('departmentId', instance.departmentId?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

EmployeeCreateWithoutPersonInput _$EmployeeCreateWithoutPersonInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeCreateWithoutPersonInput(
      id: json['id'] as String?,
      position: json['position'] as int,
      department: DepartmentCreateNestedOneWithoutEmployeesInput.fromJson(
          json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeCreateWithoutPersonInputToJson(
    EmployeeCreateWithoutPersonInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['position'] = instance.position;
  val['department'] = instance.department.toJson();
  return val;
}

EmployeeUncheckedCreateWithoutPersonInput
    _$EmployeeUncheckedCreateWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedCreateWithoutPersonInput(
          id: json['id'] as String?,
          departmentId: json['departmentId'] as int,
          position: json['position'] as int,
        );

Map<String, dynamic> _$EmployeeUncheckedCreateWithoutPersonInputToJson(
    EmployeeUncheckedCreateWithoutPersonInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['departmentId'] = instance.departmentId;
  val['position'] = instance.position;
  return val;
}

EmployeeCreateOrConnectWithoutPersonInput
    _$EmployeeCreateOrConnectWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeCreateOrConnectWithoutPersonInput(
          where: EmployeeWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: EmployeeCreateWithoutPersonInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeCreateOrConnectWithoutPersonInputToJson(
        EmployeeCreateOrConnectWithoutPersonInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

EmployeeUpsertWithWhereUniqueWithoutPersonInput
    _$EmployeeUpsertWithWhereUniqueWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpsertWithWhereUniqueWithoutPersonInput(
          where: EmployeeWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          update: EmployeeUpdateWithoutPersonInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: EmployeeCreateWithoutPersonInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUpsertWithWhereUniqueWithoutPersonInputToJson(
        EmployeeUpsertWithWhereUniqueWithoutPersonInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

EmployeeUpdateWithWhereUniqueWithoutPersonInput
    _$EmployeeUpdateWithWhereUniqueWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpdateWithWhereUniqueWithoutPersonInput(
          where: EmployeeWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: EmployeeUpdateWithoutPersonInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUpdateWithWhereUniqueWithoutPersonInputToJson(
        EmployeeUpdateWithWhereUniqueWithoutPersonInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

EmployeeUpdateManyWithWhereWithoutPersonInput
    _$EmployeeUpdateManyWithWhereWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUpdateManyWithWhereWithoutPersonInput(
          where: EmployeeScalarWhereInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: EmployeeUpdateManyMutationInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUpdateManyWithWhereWithoutPersonInputToJson(
        EmployeeUpdateManyWithWhereWithoutPersonInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

DepartmentCreateWithoutEmployeesInput
    _$DepartmentCreateWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentCreateWithoutEmployeesInput(
          name: json['name'] as String,
        );

Map<String, dynamic> _$DepartmentCreateWithoutEmployeesInputToJson(
        DepartmentCreateWithoutEmployeesInput instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

DepartmentUncheckedCreateWithoutEmployeesInput
    _$DepartmentUncheckedCreateWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentUncheckedCreateWithoutEmployeesInput(
          id: json['id'] as int?,
          name: json['name'] as String,
        );

Map<String, dynamic> _$DepartmentUncheckedCreateWithoutEmployeesInputToJson(
    DepartmentUncheckedCreateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  return val;
}

DepartmentCreateOrConnectWithoutEmployeesInput
    _$DepartmentCreateOrConnectWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentCreateOrConnectWithoutEmployeesInput(
          where: DepartmentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: DepartmentCreateWithoutEmployeesInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentCreateOrConnectWithoutEmployeesInputToJson(
        DepartmentCreateOrConnectWithoutEmployeesInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

PersonCreateWithoutEmployeesInput _$PersonCreateWithoutEmployeesInputFromJson(
        Map<String, dynamic> json) =>
    PersonCreateWithoutEmployeesInput(
      id: json['id'] as String?,
      name: json['name'] as String,
      address: json['address'] as String,
      birthDate:
          const DateTimeJsonConverter().fromJson(json['birthDate'] as String),
    );

Map<String, dynamic> _$PersonCreateWithoutEmployeesInputToJson(
    PersonCreateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['address'] = instance.address;
  val['birthDate'] = const DateTimeJsonConverter().toJson(instance.birthDate);
  return val;
}

PersonUncheckedCreateWithoutEmployeesInput
    _$PersonUncheckedCreateWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        PersonUncheckedCreateWithoutEmployeesInput(
          id: json['id'] as String?,
          name: json['name'] as String,
          address: json['address'] as String,
          birthDate: const DateTimeJsonConverter()
              .fromJson(json['birthDate'] as String),
        );

Map<String, dynamic> _$PersonUncheckedCreateWithoutEmployeesInputToJson(
    PersonUncheckedCreateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  val['address'] = instance.address;
  val['birthDate'] = const DateTimeJsonConverter().toJson(instance.birthDate);
  return val;
}

PersonCreateOrConnectWithoutEmployeesInput
    _$PersonCreateOrConnectWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        PersonCreateOrConnectWithoutEmployeesInput(
          where: PersonWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: PersonCreateWithoutEmployeesInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PersonCreateOrConnectWithoutEmployeesInputToJson(
        PersonCreateOrConnectWithoutEmployeesInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

DepartmentUpsertWithoutEmployeesInput
    _$DepartmentUpsertWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentUpsertWithoutEmployeesInput(
          update: DepartmentUpdateWithoutEmployeesInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: DepartmentCreateWithoutEmployeesInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentUpsertWithoutEmployeesInputToJson(
        DepartmentUpsertWithoutEmployeesInput instance) =>
    <String, dynamic>{
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

DepartmentUpdateWithoutEmployeesInput
    _$DepartmentUpdateWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentUpdateWithoutEmployeesInput(
          name: json['name'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['name'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentUpdateWithoutEmployeesInputToJson(
    DepartmentUpdateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name?.toJson());
  return val;
}

DepartmentUncheckedUpdateWithoutEmployeesInput
    _$DepartmentUncheckedUpdateWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        DepartmentUncheckedUpdateWithoutEmployeesInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          name: json['name'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['name'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$DepartmentUncheckedUpdateWithoutEmployeesInputToJson(
    DepartmentUncheckedUpdateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  return val;
}

PersonUpsertWithoutEmployeesInput _$PersonUpsertWithoutEmployeesInputFromJson(
        Map<String, dynamic> json) =>
    PersonUpsertWithoutEmployeesInput(
      update: PersonUpdateWithoutEmployeesInput.fromJson(
          json['update'] as Map<String, dynamic>),
      create: PersonCreateWithoutEmployeesInput.fromJson(
          json['create'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUpsertWithoutEmployeesInputToJson(
        PersonUpsertWithoutEmployeesInput instance) =>
    <String, dynamic>{
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

PersonUpdateWithoutEmployeesInput _$PersonUpdateWithoutEmployeesInputFromJson(
        Map<String, dynamic> json) =>
    PersonUpdateWithoutEmployeesInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      name: json['name'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['address'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? null
          : DateTimeFieldUpdateOperationsInput.fromJson(
              json['birthDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonUpdateWithoutEmployeesInputToJson(
    PersonUpdateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  return val;
}

PersonUncheckedUpdateWithoutEmployeesInput
    _$PersonUncheckedUpdateWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        PersonUncheckedUpdateWithoutEmployeesInput(
          id: json['id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          name: json['name'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['name'] as Map<String, dynamic>),
          address: json['address'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['address'] as Map<String, dynamic>),
          birthDate: json['birthDate'] == null
              ? null
              : DateTimeFieldUpdateOperationsInput.fromJson(
                  json['birthDate'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PersonUncheckedUpdateWithoutEmployeesInputToJson(
    PersonUncheckedUpdateWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('name', instance.name?.toJson());
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('birthDate', instance.birthDate?.toJson());
  return val;
}

EmployeeUpdateWithoutDepartmentInput
    _$EmployeeUpdateWithoutDepartmentInputFromJson(Map<String, dynamic> json) =>
        EmployeeUpdateWithoutDepartmentInput(
          id: json['id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          position: json['position'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['position'] as Map<String, dynamic>),
          person: json['person'] == null
              ? null
              : PersonUpdateOneRequiredWithoutEmployeesNestedInput.fromJson(
                  json['person'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUpdateWithoutDepartmentInputToJson(
    EmployeeUpdateWithoutDepartmentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('person', instance.person?.toJson());
  return val;
}

EmployeeUncheckedUpdateWithoutDepartmentInput
    _$EmployeeUncheckedUpdateWithoutDepartmentInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedUpdateWithoutDepartmentInput(
          id: json['id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          personId: json['personId'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['personId'] as Map<String, dynamic>),
          position: json['position'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['position'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUncheckedUpdateWithoutDepartmentInputToJson(
    EmployeeUncheckedUpdateWithoutDepartmentInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

EmployeeUncheckedUpdateManyWithoutEmployeesInput
    _$EmployeeUncheckedUpdateManyWithoutEmployeesInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedUpdateManyWithoutEmployeesInput(
          id: json['id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          personId: json['personId'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['personId'] as Map<String, dynamic>),
          position: json['position'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['position'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUncheckedUpdateManyWithoutEmployeesInputToJson(
    EmployeeUncheckedUpdateManyWithoutEmployeesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('personId', instance.personId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

EmployeeUpdateWithoutPersonInput _$EmployeeUpdateWithoutPersonInputFromJson(
        Map<String, dynamic> json) =>
    EmployeeUpdateWithoutPersonInput(
      id: json['id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['position'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : DepartmentUpdateOneRequiredWithoutEmployeesNestedInput.fromJson(
              json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeUpdateWithoutPersonInputToJson(
    EmployeeUpdateWithoutPersonInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('position', instance.position?.toJson());
  writeNotNull('department', instance.department?.toJson());
  return val;
}

EmployeeUncheckedUpdateWithoutPersonInput
    _$EmployeeUncheckedUpdateWithoutPersonInputFromJson(
            Map<String, dynamic> json) =>
        EmployeeUncheckedUpdateWithoutPersonInput(
          id: json['id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          departmentId: json['departmentId'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['departmentId'] as Map<String, dynamic>),
          position: json['position'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['position'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$EmployeeUncheckedUpdateWithoutPersonInputToJson(
    EmployeeUncheckedUpdateWithoutPersonInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('departmentId', instance.departmentId?.toJson());
  writeNotNull('position', instance.position?.toJson());
  return val;
}

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      birthDate:
          const DateTimeJsonConverter().fromJson(json['birthDate'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'birthDate': const DateTimeJsonConverter().toJson(instance.birthDate),
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as String,
      departmentId: json['departmentId'] as int,
      personId: json['personId'] as String,
      position: json['position'] as int,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'departmentId': instance.departmentId,
      'personId': instance.personId,
      'position': instance.position,
    };

DepartmentGroupByOutputType _$DepartmentGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    DepartmentGroupByOutputType(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DepartmentGroupByOutputTypeToJson(
    DepartmentGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

PersonGroupByOutputType _$PersonGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    PersonGroupByOutputType(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      birthDate: _$JsonConverterFromJson<String, DateTime>(
          json['birthDate'], const DateTimeJsonConverter().fromJson),
    );

Map<String, dynamic> _$PersonGroupByOutputTypeToJson(
    PersonGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  writeNotNull(
      'birthDate',
      _$JsonConverterToJson<String, DateTime>(
          instance.birthDate, const DateTimeJsonConverter().toJson));
  return val;
}

EmployeeGroupByOutputType _$EmployeeGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    EmployeeGroupByOutputType(
      id: json['id'] as String?,
      departmentId: json['departmentId'] as int?,
      personId: json['personId'] as String?,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$EmployeeGroupByOutputTypeToJson(
    EmployeeGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('departmentId', instance.departmentId);
  writeNotNull('personId', instance.personId);
  writeNotNull('position', instance.position);
  return val;
}

AffectedRowsOutput _$AffectedRowsOutputFromJson(Map<String, dynamic> json) =>
    AffectedRowsOutput(
      count: json['count'] as int?,
    );

Map<String, dynamic> _$AffectedRowsOutputToJson(AffectedRowsOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  return val;
}

Map<String, dynamic> _$DatasourcesToJson(Datasources instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('db', instance.db);
  return val;
}
