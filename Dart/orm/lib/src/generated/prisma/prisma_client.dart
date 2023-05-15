// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_annotation/json_annotation.dart';
import 'package:orm/binary_engine.dart' as _i5;
import 'package:orm/engine_core.dart' as _i3;
import 'package:orm/graphql.dart' as _i2;
import 'package:orm/logger.dart' as _i4;
import 'package:orm/orm.dart' as _i1;
import 'package:orm/orm.dart' show DateTimeJsonConverter;

part 'prisma_client.g.dart';

enum DepartmentScalarFieldEnum implements _i1.PrismaEnum {
  id,
  name;

  @override
  String? get originalName => null;
}

enum EmployeeScalarFieldEnum implements _i1.PrismaEnum {
  id,
  departmentId,
  personId,
  position;

  @override
  String? get originalName => null;
}

enum PersonScalarFieldEnum implements _i1.PrismaEnum {
  id,
  name,
  address,
  birthDate;

  @override
  String? get originalName => null;
}

enum SortOrder implements _i1.PrismaEnum {
  asc,
  desc;

  @override
  String? get originalName => null;
}

@_i1.jsonSerializable
class DepartmentWhereInput implements _i1.JsonSerializable {
  const DepartmentWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
    this.employees,
  });

  factory DepartmentWhereInput.fromJson(Map<String, dynamic> json) =>
      _$DepartmentWhereInputFromJson(json);

  final Iterable<DepartmentWhereInput>? AND;

  final Iterable<DepartmentWhereInput>? OR;

  final Iterable<DepartmentWhereInput>? NOT;

  final IntFilter? id;

  final StringFilter? name;

  final EmployeeListRelationFilter? employees;

  @override
  Map<String, dynamic> toJson() => _$DepartmentWhereInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentOrderByWithRelationInput implements _i1.JsonSerializable {
  const DepartmentOrderByWithRelationInput({
    this.id,
    this.name,
    this.employees,
  });

  factory DepartmentOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  final EmployeeOrderByRelationAggregateInput? employees;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentWhereUniqueInput implements _i1.JsonSerializable {
  const DepartmentWhereUniqueInput({this.id});

  factory DepartmentWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$DepartmentWhereUniqueInputFromJson(json);

  final int? id;

  @override
  Map<String, dynamic> toJson() => _$DepartmentWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentOrderByWithAggregationInput implements _i1.JsonSerializable {
  const DepartmentOrderByWithAggregationInput({
    this.id,
    this.name,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory DepartmentOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  @JsonKey(name: r'_count')
  final DepartmentCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final DepartmentAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final DepartmentMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final DepartmentMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final DepartmentSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const DepartmentScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
  });

  factory DepartmentScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<DepartmentScalarWhereWithAggregatesInput>? AND;

  final Iterable<DepartmentScalarWhereWithAggregatesInput>? OR;

  final Iterable<DepartmentScalarWhereWithAggregatesInput>? NOT;

  final IntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class PersonWhereInput implements _i1.JsonSerializable {
  const PersonWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
    this.address,
    this.birthDate,
    this.employees,
  });

  factory PersonWhereInput.fromJson(Map<String, dynamic> json) =>
      _$PersonWhereInputFromJson(json);

  final Iterable<PersonWhereInput>? AND;

  final Iterable<PersonWhereInput>? OR;

  final Iterable<PersonWhereInput>? NOT;

  final StringFilter? id;

  final StringFilter? name;

  final StringFilter? address;

  final DateTimeFilter? birthDate;

  final EmployeeListRelationFilter? employees;

  @override
  Map<String, dynamic> toJson() => _$PersonWhereInputToJson(this);
}

@_i1.jsonSerializable
class PersonOrderByWithRelationInput implements _i1.JsonSerializable {
  const PersonOrderByWithRelationInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
    this.employees,
  });

  factory PersonOrderByWithRelationInput.fromJson(Map<String, dynamic> json) =>
      _$PersonOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  final SortOrder? address;

  final SortOrder? birthDate;

  final EmployeeOrderByRelationAggregateInput? employees;

  @override
  Map<String, dynamic> toJson() => _$PersonOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class PersonWhereUniqueInput implements _i1.JsonSerializable {
  const PersonWhereUniqueInput({this.id});

  factory PersonWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$PersonWhereUniqueInputFromJson(json);

  final String? id;

  @override
  Map<String, dynamic> toJson() => _$PersonWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class PersonOrderByWithAggregationInput implements _i1.JsonSerializable {
  const PersonOrderByWithAggregationInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
    this.$count,
    this.$max,
    this.$min,
  });

  factory PersonOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  final SortOrder? address;

  final SortOrder? birthDate;

  @JsonKey(name: r'_count')
  final PersonCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_max')
  final PersonMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final PersonMinOrderByAggregateInput? $min;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class PersonScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const PersonScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<PersonScalarWhereWithAggregatesInput>? AND;

  final Iterable<PersonScalarWhereWithAggregatesInput>? OR;

  final Iterable<PersonScalarWhereWithAggregatesInput>? NOT;

  final StringWithAggregatesFilter? id;

  final StringWithAggregatesFilter? name;

  final StringWithAggregatesFilter? address;

  final DateTimeWithAggregatesFilter? birthDate;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeWhereInput implements _i1.JsonSerializable {
  const EmployeeWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.departmentId,
    this.personId,
    this.position,
    this.department,
    this.person,
  });

  factory EmployeeWhereInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeWhereInputFromJson(json);

  final Iterable<EmployeeWhereInput>? AND;

  final Iterable<EmployeeWhereInput>? OR;

  final Iterable<EmployeeWhereInput>? NOT;

  final StringFilter? id;

  final IntFilter? departmentId;

  final StringFilter? personId;

  final IntFilter? position;

  final DepartmentRelationFilter? department;

  final PersonRelationFilter? person;

  @override
  Map<String, dynamic> toJson() => _$EmployeeWhereInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeOrderByWithRelationInput implements _i1.JsonSerializable {
  const EmployeeOrderByWithRelationInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
    this.department,
    this.person,
  });

  factory EmployeeOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? departmentId;

  final SortOrder? personId;

  final SortOrder? position;

  final DepartmentOrderByWithRelationInput? department;

  final PersonOrderByWithRelationInput? person;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeWhereUniqueInput implements _i1.JsonSerializable {
  const EmployeeWhereUniqueInput({this.id});

  factory EmployeeWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeWhereUniqueInputFromJson(json);

  final String? id;

  @override
  Map<String, dynamic> toJson() => _$EmployeeWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeOrderByWithAggregationInput implements _i1.JsonSerializable {
  const EmployeeOrderByWithAggregationInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory EmployeeOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? departmentId;

  final SortOrder? personId;

  final SortOrder? position;

  @JsonKey(name: r'_count')
  final EmployeeCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final EmployeeAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final EmployeeMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final EmployeeMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final EmployeeSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const EmployeeScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<EmployeeScalarWhereWithAggregatesInput>? AND;

  final Iterable<EmployeeScalarWhereWithAggregatesInput>? OR;

  final Iterable<EmployeeScalarWhereWithAggregatesInput>? NOT;

  final StringWithAggregatesFilter? id;

  final IntWithAggregatesFilter? departmentId;

  final StringWithAggregatesFilter? personId;

  final IntWithAggregatesFilter? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentCreateInput implements _i1.JsonSerializable {
  const DepartmentCreateInput({
    required this.name,
    this.employees,
  });

  factory DepartmentCreateInput.fromJson(Map<String, dynamic> json) =>
      _$DepartmentCreateInputFromJson(json);

  final String name;

  final EmployeeCreateNestedManyWithoutDepartmentInput? employees;

  @override
  Map<String, dynamic> toJson() => _$DepartmentCreateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUncheckedCreateInput implements _i1.JsonSerializable {
  const DepartmentUncheckedCreateInput({
    this.id,
    required this.name,
    this.employees,
  });

  factory DepartmentUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$DepartmentUncheckedCreateInputFromJson(json);

  final int? id;

  final String name;

  final EmployeeUncheckedCreateNestedManyWithoutDepartmentInput? employees;

  @override
  Map<String, dynamic> toJson() => _$DepartmentUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUpdateInput implements _i1.JsonSerializable {
  const DepartmentUpdateInput({
    this.name,
    this.employees,
  });

  factory DepartmentUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$DepartmentUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? name;

  final EmployeeUpdateManyWithoutDepartmentNestedInput? employees;

  @override
  Map<String, dynamic> toJson() => _$DepartmentUpdateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUncheckedUpdateInput implements _i1.JsonSerializable {
  const DepartmentUncheckedUpdateInput({
    this.id,
    this.name,
    this.employees,
  });

  factory DepartmentUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$DepartmentUncheckedUpdateInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput? employees;

  @override
  Map<String, dynamic> toJson() => _$DepartmentUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUpdateManyMutationInput implements _i1.JsonSerializable {
  const DepartmentUpdateManyMutationInput({this.name});

  factory DepartmentUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUpdateManyMutationInputFromJson(json);

  final StringFieldUpdateOperationsInput? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const DepartmentUncheckedUpdateManyInput({
    this.id,
    this.name,
  });

  factory DepartmentUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUncheckedUpdateManyInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class PersonCreateInput implements _i1.JsonSerializable {
  const PersonCreateInput({
    this.id,
    required this.name,
    required this.address,
    required this.birthDate,
    this.employees,
  });

  factory PersonCreateInput.fromJson(Map<String, dynamic> json) =>
      _$PersonCreateInputFromJson(json);

  final String? id;

  final String name;

  final String address;

  final DateTime birthDate;

  final EmployeeCreateNestedManyWithoutPersonInput? employees;

  @override
  Map<String, dynamic> toJson() => _$PersonCreateInputToJson(this);
}

@_i1.jsonSerializable
class PersonUncheckedCreateInput implements _i1.JsonSerializable {
  const PersonUncheckedCreateInput({
    this.id,
    required this.name,
    required this.address,
    required this.birthDate,
    this.employees,
  });

  factory PersonUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$PersonUncheckedCreateInputFromJson(json);

  final String? id;

  final String name;

  final String address;

  final DateTime birthDate;

  final EmployeeUncheckedCreateNestedManyWithoutPersonInput? employees;

  @override
  Map<String, dynamic> toJson() => _$PersonUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class PersonUpdateInput implements _i1.JsonSerializable {
  const PersonUpdateInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
    this.employees,
  });

  factory PersonUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$PersonUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final StringFieldUpdateOperationsInput? address;

  final DateTimeFieldUpdateOperationsInput? birthDate;

  final EmployeeUpdateManyWithoutPersonNestedInput? employees;

  @override
  Map<String, dynamic> toJson() => _$PersonUpdateInputToJson(this);
}

@_i1.jsonSerializable
class PersonUncheckedUpdateInput implements _i1.JsonSerializable {
  const PersonUncheckedUpdateInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
    this.employees,
  });

  factory PersonUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$PersonUncheckedUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final StringFieldUpdateOperationsInput? address;

  final DateTimeFieldUpdateOperationsInput? birthDate;

  final EmployeeUncheckedUpdateManyWithoutPersonNestedInput? employees;

  @override
  Map<String, dynamic> toJson() => _$PersonUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class PersonUpdateManyMutationInput implements _i1.JsonSerializable {
  const PersonUpdateManyMutationInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$PersonUpdateManyMutationInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final StringFieldUpdateOperationsInput? address;

  final DateTimeFieldUpdateOperationsInput? birthDate;

  @override
  Map<String, dynamic> toJson() => _$PersonUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class PersonUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const PersonUncheckedUpdateManyInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonUncheckedUpdateManyInput.fromJson(Map<String, dynamic> json) =>
      _$PersonUncheckedUpdateManyInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final StringFieldUpdateOperationsInput? address;

  final DateTimeFieldUpdateOperationsInput? birthDate;

  @override
  Map<String, dynamic> toJson() => _$PersonUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateInput implements _i1.JsonSerializable {
  const EmployeeCreateInput({
    this.id,
    required this.position,
    required this.department,
    required this.person,
  });

  factory EmployeeCreateInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeCreateInputFromJson(json);

  final String? id;

  final int position;

  final DepartmentCreateNestedOneWithoutEmployeesInput department;

  final PersonCreateNestedOneWithoutEmployeesInput person;

  @override
  Map<String, dynamic> toJson() => _$EmployeeCreateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedCreateInput implements _i1.JsonSerializable {
  const EmployeeUncheckedCreateInput({
    this.id,
    required this.departmentId,
    required this.personId,
    required this.position,
  });

  factory EmployeeUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUncheckedCreateInputFromJson(json);

  final String? id;

  final int departmentId;

  final String personId;

  final int position;

  @override
  Map<String, dynamic> toJson() => _$EmployeeUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateInput implements _i1.JsonSerializable {
  const EmployeeUpdateInput({
    this.id,
    this.position,
    this.department,
    this.person,
  });

  factory EmployeeUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? position;

  final DepartmentUpdateOneRequiredWithoutEmployeesNestedInput? department;

  final PersonUpdateOneRequiredWithoutEmployeesNestedInput? person;

  @override
  Map<String, dynamic> toJson() => _$EmployeeUpdateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateInput implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? departmentId;

  final StringFieldUpdateOperationsInput? personId;

  final IntFieldUpdateOperationsInput? position;

  @override
  Map<String, dynamic> toJson() => _$EmployeeUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateManyMutationInput implements _i1.JsonSerializable {
  const EmployeeUpdateManyMutationInput({
    this.id,
    this.position,
  });

  factory EmployeeUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeUpdateManyMutationInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateManyInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateManyInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? departmentId;

  final StringFieldUpdateOperationsInput? personId;

  final IntFieldUpdateOperationsInput? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class IntFilter implements _i1.JsonSerializable {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory IntFilter.fromJson(Map<String, dynamic> json) =>
      _$IntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$IntFilterToJson(this);
}

@_i1.jsonSerializable
class StringFilter implements _i1.JsonSerializable {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringFilterToJson(this);
}

@_i1.jsonSerializable
class EmployeeListRelationFilter implements _i1.JsonSerializable {
  const EmployeeListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  factory EmployeeListRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListRelationFilterFromJson(json);

  final EmployeeWhereInput? every;

  final EmployeeWhereInput? some;

  final EmployeeWhereInput? none;

  @override
  Map<String, dynamic> toJson() => _$EmployeeListRelationFilterToJson(this);
}

@_i1.jsonSerializable
class EmployeeOrderByRelationAggregateInput implements _i1.JsonSerializable {
  const EmployeeOrderByRelationAggregateInput({this.$count});

  factory EmployeeOrderByRelationAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeOrderByRelationAggregateInputFromJson(json);

  @JsonKey(name: r'_count')
  final SortOrder? $count;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeOrderByRelationAggregateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentCountOrderByAggregateInput implements _i1.JsonSerializable {
  const DepartmentCountOrderByAggregateInput({
    this.id,
    this.name,
  });

  factory DepartmentCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const DepartmentAvgOrderByAggregateInput({this.id});

  factory DepartmentAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const DepartmentMaxOrderByAggregateInput({
    this.id,
    this.name,
  });

  factory DepartmentMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentMinOrderByAggregateInput implements _i1.JsonSerializable {
  const DepartmentMinOrderByAggregateInput({
    this.id,
    this.name,
  });

  factory DepartmentMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentSumOrderByAggregateInput implements _i1.JsonSerializable {
  const DepartmentSumOrderByAggregateInput({this.id});

  factory DepartmentSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class IntWithAggregatesFilter implements _i1.JsonSerializable {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory IntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$IntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$IntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringWithAggregatesFilter implements _i1.JsonSerializable {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$StringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$StringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class DateTimeFilter implements _i1.JsonSerializable {
  const DateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory DateTimeFilter.fromJson(Map<String, dynamic> json) =>
      _$DateTimeFilterFromJson(json);

  final DateTime? equals;

  @JsonKey(name: r'in')
  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final DateTime? lt;

  final DateTime? lte;

  final DateTime? gt;

  final DateTime? gte;

  final NestedDateTimeFilter? not;

  @override
  Map<String, dynamic> toJson() => _$DateTimeFilterToJson(this);
}

@_i1.jsonSerializable
class PersonCountOrderByAggregateInput implements _i1.JsonSerializable {
  const PersonCountOrderByAggregateInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  final SortOrder? address;

  final SortOrder? birthDate;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PersonMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const PersonMaxOrderByAggregateInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonMaxOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$PersonMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  final SortOrder? address;

  final SortOrder? birthDate;

  @override
  Map<String, dynamic> toJson() => _$PersonMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PersonMinOrderByAggregateInput implements _i1.JsonSerializable {
  const PersonMinOrderByAggregateInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonMinOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$PersonMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? name;

  final SortOrder? address;

  final SortOrder? birthDate;

  @override
  Map<String, dynamic> toJson() => _$PersonMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class DateTimeWithAggregatesFilter implements _i1.JsonSerializable {
  const DateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory DateTimeWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$DateTimeWithAggregatesFilterFromJson(json);

  final DateTime? equals;

  @JsonKey(name: r'in')
  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final DateTime? lt;

  final DateTime? lte;

  final DateTime? gt;

  final DateTime? gte;

  final NestedDateTimeWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedDateTimeFilter? $min;

  @JsonKey(name: r'_max')
  final NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$DateTimeWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class DepartmentRelationFilter implements _i1.JsonSerializable {
  const DepartmentRelationFilter({
    this.$is,
    this.isNot,
  });

  factory DepartmentRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$DepartmentRelationFilterFromJson(json);

  @JsonKey(name: r'is')
  final DepartmentWhereInput? $is;

  final DepartmentWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => _$DepartmentRelationFilterToJson(this);
}

@_i1.jsonSerializable
class PersonRelationFilter implements _i1.JsonSerializable {
  const PersonRelationFilter({
    this.$is,
    this.isNot,
  });

  factory PersonRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$PersonRelationFilterFromJson(json);

  @JsonKey(name: r'is')
  final PersonWhereInput? $is;

  final PersonWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => _$PersonRelationFilterToJson(this);
}

@_i1.jsonSerializable
class EmployeeCountOrderByAggregateInput implements _i1.JsonSerializable {
  const EmployeeCountOrderByAggregateInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? departmentId;

  final SortOrder? personId;

  final SortOrder? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const EmployeeAvgOrderByAggregateInput({
    this.departmentId,
    this.position,
  });

  factory EmployeeAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeAvgOrderByAggregateInputFromJson(json);

  final SortOrder? departmentId;

  final SortOrder? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const EmployeeMaxOrderByAggregateInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? departmentId;

  final SortOrder? personId;

  final SortOrder? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeMinOrderByAggregateInput implements _i1.JsonSerializable {
  const EmployeeMinOrderByAggregateInput({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? departmentId;

  final SortOrder? personId;

  final SortOrder? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeSumOrderByAggregateInput implements _i1.JsonSerializable {
  const EmployeeSumOrderByAggregateInput({
    this.departmentId,
    this.position,
  });

  factory EmployeeSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeSumOrderByAggregateInputFromJson(json);

  final SortOrder? departmentId;

  final SortOrder? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateNestedManyWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeCreateNestedManyWithoutDepartmentInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory EmployeeCreateNestedManyWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCreateNestedManyWithoutDepartmentInputFromJson(json);

  final Iterable<EmployeeCreateWithoutDepartmentInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutDepartmentInput>?
      connectOrCreate;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCreateNestedManyWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedCreateNestedManyWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedCreateNestedManyWithoutDepartmentInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory EmployeeUncheckedCreateNestedManyWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedCreateNestedManyWithoutDepartmentInputFromJson(json);

  final Iterable<EmployeeCreateWithoutDepartmentInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutDepartmentInput>?
      connectOrCreate;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedCreateNestedManyWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class StringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const StringFieldUpdateOperationsInput({this.set});

  factory StringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$StringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$StringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateManyWithoutDepartmentNestedInput
    implements _i1.JsonSerializable {
  const EmployeeUpdateManyWithoutDepartmentNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory EmployeeUpdateManyWithoutDepartmentNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateManyWithoutDepartmentNestedInputFromJson(json);

  final Iterable<EmployeeCreateWithoutDepartmentInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutDepartmentInput>?
      connectOrCreate;

  final Iterable<EmployeeUpsertWithWhereUniqueWithoutDepartmentInput>? upsert;

  final Iterable<EmployeeWhereUniqueInput>? set;

  final Iterable<EmployeeWhereUniqueInput>? disconnect;

  final Iterable<EmployeeWhereUniqueInput>? delete;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  final Iterable<EmployeeUpdateWithWhereUniqueWithoutDepartmentInput>? update;

  final Iterable<EmployeeUpdateManyWithWhereWithoutDepartmentInput>? updateMany;

  final Iterable<EmployeeScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateManyWithoutDepartmentNestedInputToJson(this);
}

@_i1.jsonSerializable
class IntFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  factory IntFieldUpdateOperationsInput.fromJson(Map<String, dynamic> json) =>
      _$IntFieldUpdateOperationsInputFromJson(json);

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => _$IntFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory EmployeeUncheckedUpdateManyWithoutDepartmentNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateManyWithoutDepartmentNestedInputFromJson(json);

  final Iterable<EmployeeCreateWithoutDepartmentInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutDepartmentInput>?
      connectOrCreate;

  final Iterable<EmployeeUpsertWithWhereUniqueWithoutDepartmentInput>? upsert;

  final Iterable<EmployeeWhereUniqueInput>? set;

  final Iterable<EmployeeWhereUniqueInput>? disconnect;

  final Iterable<EmployeeWhereUniqueInput>? delete;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  final Iterable<EmployeeUpdateWithWhereUniqueWithoutDepartmentInput>? update;

  final Iterable<EmployeeUpdateManyWithWhereWithoutDepartmentInput>? updateMany;

  final Iterable<EmployeeScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedUpdateManyWithoutDepartmentNestedInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateNestedManyWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeCreateNestedManyWithoutPersonInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory EmployeeCreateNestedManyWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCreateNestedManyWithoutPersonInputFromJson(json);

  final Iterable<EmployeeCreateWithoutPersonInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutPersonInput>? connectOrCreate;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCreateNestedManyWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedCreateNestedManyWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedCreateNestedManyWithoutPersonInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory EmployeeUncheckedCreateNestedManyWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedCreateNestedManyWithoutPersonInputFromJson(json);

  final Iterable<EmployeeCreateWithoutPersonInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutPersonInput>? connectOrCreate;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedCreateNestedManyWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class DateTimeFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const DateTimeFieldUpdateOperationsInput({this.set});

  factory DateTimeFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$DateTimeFieldUpdateOperationsInputFromJson(json);

  final DateTime? set;

  @override
  Map<String, dynamic> toJson() =>
      _$DateTimeFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateManyWithoutPersonNestedInput
    implements _i1.JsonSerializable {
  const EmployeeUpdateManyWithoutPersonNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory EmployeeUpdateManyWithoutPersonNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateManyWithoutPersonNestedInputFromJson(json);

  final Iterable<EmployeeCreateWithoutPersonInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutPersonInput>? connectOrCreate;

  final Iterable<EmployeeUpsertWithWhereUniqueWithoutPersonInput>? upsert;

  final Iterable<EmployeeWhereUniqueInput>? set;

  final Iterable<EmployeeWhereUniqueInput>? disconnect;

  final Iterable<EmployeeWhereUniqueInput>? delete;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  final Iterable<EmployeeUpdateWithWhereUniqueWithoutPersonInput>? update;

  final Iterable<EmployeeUpdateManyWithWhereWithoutPersonInput>? updateMany;

  final Iterable<EmployeeScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateManyWithoutPersonNestedInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateManyWithoutPersonNestedInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateManyWithoutPersonNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory EmployeeUncheckedUpdateManyWithoutPersonNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateManyWithoutPersonNestedInputFromJson(json);

  final Iterable<EmployeeCreateWithoutPersonInput>? create;

  final Iterable<EmployeeCreateOrConnectWithoutPersonInput>? connectOrCreate;

  final Iterable<EmployeeUpsertWithWhereUniqueWithoutPersonInput>? upsert;

  final Iterable<EmployeeWhereUniqueInput>? set;

  final Iterable<EmployeeWhereUniqueInput>? disconnect;

  final Iterable<EmployeeWhereUniqueInput>? delete;

  final Iterable<EmployeeWhereUniqueInput>? connect;

  final Iterable<EmployeeUpdateWithWhereUniqueWithoutPersonInput>? update;

  final Iterable<EmployeeUpdateManyWithWhereWithoutPersonInput>? updateMany;

  final Iterable<EmployeeScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedUpdateManyWithoutPersonNestedInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentCreateNestedOneWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const DepartmentCreateNestedOneWithoutEmployeesInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory DepartmentCreateNestedOneWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentCreateNestedOneWithoutEmployeesInputFromJson(json);

  final DepartmentCreateWithoutEmployeesInput? create;

  final DepartmentCreateOrConnectWithoutEmployeesInput? connectOrCreate;

  final DepartmentWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentCreateNestedOneWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonCreateNestedOneWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const PersonCreateNestedOneWithoutEmployeesInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory PersonCreateNestedOneWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonCreateNestedOneWithoutEmployeesInputFromJson(json);

  final PersonCreateWithoutEmployeesInput? create;

  final PersonCreateOrConnectWithoutEmployeesInput? connectOrCreate;

  final PersonWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonCreateNestedOneWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUpdateOneRequiredWithoutEmployeesNestedInput
    implements _i1.JsonSerializable {
  const DepartmentUpdateOneRequiredWithoutEmployeesNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  factory DepartmentUpdateOneRequiredWithoutEmployeesNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUpdateOneRequiredWithoutEmployeesNestedInputFromJson(json);

  final DepartmentCreateWithoutEmployeesInput? create;

  final DepartmentCreateOrConnectWithoutEmployeesInput? connectOrCreate;

  final DepartmentUpsertWithoutEmployeesInput? upsert;

  final DepartmentWhereUniqueInput? connect;

  final DepartmentUpdateWithoutEmployeesInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUpdateOneRequiredWithoutEmployeesNestedInputToJson(this);
}

@_i1.jsonSerializable
class PersonUpdateOneRequiredWithoutEmployeesNestedInput
    implements _i1.JsonSerializable {
  const PersonUpdateOneRequiredWithoutEmployeesNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  factory PersonUpdateOneRequiredWithoutEmployeesNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonUpdateOneRequiredWithoutEmployeesNestedInputFromJson(json);

  final PersonCreateWithoutEmployeesInput? create;

  final PersonCreateOrConnectWithoutEmployeesInput? connectOrCreate;

  final PersonUpsertWithoutEmployeesInput? upsert;

  final PersonWhereUniqueInput? connect;

  final PersonUpdateWithoutEmployeesInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonUpdateOneRequiredWithoutEmployeesNestedInputToJson(this);
}

@_i1.jsonSerializable
class NestedIntFilter implements _i1.JsonSerializable {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringFilter implements _i1.JsonSerializable {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NestedIntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$NestedIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedFloatFilter implements _i1.JsonSerializable {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedFloatFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedFloatFilterFromJson(json);

  final double? equals;

  @JsonKey(name: r'in')
  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final double? lt;

  final double? lte;

  final double? gt;

  final double? gte;

  final NestedFloatFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedFloatFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedDateTimeFilter implements _i1.JsonSerializable {
  const NestedDateTimeFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedDateTimeFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedDateTimeFilterFromJson(json);

  final DateTime? equals;

  @JsonKey(name: r'in')
  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final DateTime? lt;

  final DateTime? lte;

  final DateTime? gt;

  final DateTime? gte;

  final NestedDateTimeFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedDateTimeFilterToJson(this);
}

@_i1.jsonSerializable
class NestedDateTimeWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedDateTimeWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedDateTimeWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedDateTimeWithAggregatesFilterFromJson(json);

  final DateTime? equals;

  @JsonKey(name: r'in')
  final Iterable<DateTime>? $in;

  final Iterable<DateTime>? notIn;

  final DateTime? lt;

  final DateTime? lte;

  final DateTime? gt;

  final DateTime? gte;

  final NestedDateTimeWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedDateTimeFilter? $min;

  @JsonKey(name: r'_max')
  final NestedDateTimeFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedDateTimeWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateWithoutDepartmentInput implements _i1.JsonSerializable {
  const EmployeeCreateWithoutDepartmentInput({
    this.id,
    required this.position,
    required this.person,
  });

  factory EmployeeCreateWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCreateWithoutDepartmentInputFromJson(json);

  final String? id;

  final int position;

  final PersonCreateNestedOneWithoutEmployeesInput person;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCreateWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedCreateWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedCreateWithoutDepartmentInput({
    this.id,
    required this.personId,
    required this.position,
  });

  factory EmployeeUncheckedCreateWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedCreateWithoutDepartmentInputFromJson(json);

  final String? id;

  final String personId;

  final int position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedCreateWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateOrConnectWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeCreateOrConnectWithoutDepartmentInput({
    required this.where,
    required this.create,
  });

  factory EmployeeCreateOrConnectWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCreateOrConnectWithoutDepartmentInputFromJson(json);

  final EmployeeWhereUniqueInput where;

  final EmployeeCreateWithoutDepartmentInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCreateOrConnectWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpsertWithWhereUniqueWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeUpsertWithWhereUniqueWithoutDepartmentInput({
    required this.where,
    required this.update,
    required this.create,
  });

  factory EmployeeUpsertWithWhereUniqueWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpsertWithWhereUniqueWithoutDepartmentInputFromJson(json);

  final EmployeeWhereUniqueInput where;

  final EmployeeUpdateWithoutDepartmentInput update;

  final EmployeeCreateWithoutDepartmentInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpsertWithWhereUniqueWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateWithWhereUniqueWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeUpdateWithWhereUniqueWithoutDepartmentInput({
    required this.where,
    required this.data,
  });

  factory EmployeeUpdateWithWhereUniqueWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateWithWhereUniqueWithoutDepartmentInputFromJson(json);

  final EmployeeWhereUniqueInput where;

  final EmployeeUpdateWithoutDepartmentInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateWithWhereUniqueWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateManyWithWhereWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeUpdateManyWithWhereWithoutDepartmentInput({
    required this.where,
    required this.data,
  });

  factory EmployeeUpdateManyWithWhereWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateManyWithWhereWithoutDepartmentInputFromJson(json);

  final EmployeeScalarWhereInput where;

  final EmployeeUpdateManyMutationInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateManyWithWhereWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeScalarWhereInput implements _i1.JsonSerializable {
  const EmployeeScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeScalarWhereInput.fromJson(Map<String, dynamic> json) =>
      _$EmployeeScalarWhereInputFromJson(json);

  final Iterable<EmployeeScalarWhereInput>? AND;

  final Iterable<EmployeeScalarWhereInput>? OR;

  final Iterable<EmployeeScalarWhereInput>? NOT;

  final StringFilter? id;

  final IntFilter? departmentId;

  final StringFilter? personId;

  final IntFilter? position;

  @override
  Map<String, dynamic> toJson() => _$EmployeeScalarWhereInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateWithoutPersonInput implements _i1.JsonSerializable {
  const EmployeeCreateWithoutPersonInput({
    this.id,
    required this.position,
    required this.department,
  });

  factory EmployeeCreateWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCreateWithoutPersonInputFromJson(json);

  final String? id;

  final int position;

  final DepartmentCreateNestedOneWithoutEmployeesInput department;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCreateWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedCreateWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedCreateWithoutPersonInput({
    this.id,
    required this.departmentId,
    required this.position,
  });

  factory EmployeeUncheckedCreateWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedCreateWithoutPersonInputFromJson(json);

  final String? id;

  final int departmentId;

  final int position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedCreateWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeCreateOrConnectWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeCreateOrConnectWithoutPersonInput({
    required this.where,
    required this.create,
  });

  factory EmployeeCreateOrConnectWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeCreateOrConnectWithoutPersonInputFromJson(json);

  final EmployeeWhereUniqueInput where;

  final EmployeeCreateWithoutPersonInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeCreateOrConnectWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpsertWithWhereUniqueWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeUpsertWithWhereUniqueWithoutPersonInput({
    required this.where,
    required this.update,
    required this.create,
  });

  factory EmployeeUpsertWithWhereUniqueWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpsertWithWhereUniqueWithoutPersonInputFromJson(json);

  final EmployeeWhereUniqueInput where;

  final EmployeeUpdateWithoutPersonInput update;

  final EmployeeCreateWithoutPersonInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpsertWithWhereUniqueWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateWithWhereUniqueWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeUpdateWithWhereUniqueWithoutPersonInput({
    required this.where,
    required this.data,
  });

  factory EmployeeUpdateWithWhereUniqueWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateWithWhereUniqueWithoutPersonInputFromJson(json);

  final EmployeeWhereUniqueInput where;

  final EmployeeUpdateWithoutPersonInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateWithWhereUniqueWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateManyWithWhereWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeUpdateManyWithWhereWithoutPersonInput({
    required this.where,
    required this.data,
  });

  factory EmployeeUpdateManyWithWhereWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateManyWithWhereWithoutPersonInputFromJson(json);

  final EmployeeScalarWhereInput where;

  final EmployeeUpdateManyMutationInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateManyWithWhereWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentCreateWithoutEmployeesInput implements _i1.JsonSerializable {
  const DepartmentCreateWithoutEmployeesInput({required this.name});

  factory DepartmentCreateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentCreateWithoutEmployeesInputFromJson(json);

  final String name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentCreateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUncheckedCreateWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const DepartmentUncheckedCreateWithoutEmployeesInput({
    this.id,
    required this.name,
  });

  factory DepartmentUncheckedCreateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUncheckedCreateWithoutEmployeesInputFromJson(json);

  final int? id;

  final String name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUncheckedCreateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentCreateOrConnectWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const DepartmentCreateOrConnectWithoutEmployeesInput({
    required this.where,
    required this.create,
  });

  factory DepartmentCreateOrConnectWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentCreateOrConnectWithoutEmployeesInputFromJson(json);

  final DepartmentWhereUniqueInput where;

  final DepartmentCreateWithoutEmployeesInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentCreateOrConnectWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonCreateWithoutEmployeesInput implements _i1.JsonSerializable {
  const PersonCreateWithoutEmployeesInput({
    this.id,
    required this.name,
    required this.address,
    required this.birthDate,
  });

  factory PersonCreateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonCreateWithoutEmployeesInputFromJson(json);

  final String? id;

  final String name;

  final String address;

  final DateTime birthDate;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonCreateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonUncheckedCreateWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const PersonUncheckedCreateWithoutEmployeesInput({
    this.id,
    required this.name,
    required this.address,
    required this.birthDate,
  });

  factory PersonUncheckedCreateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonUncheckedCreateWithoutEmployeesInputFromJson(json);

  final String? id;

  final String name;

  final String address;

  final DateTime birthDate;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonUncheckedCreateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonCreateOrConnectWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const PersonCreateOrConnectWithoutEmployeesInput({
    required this.where,
    required this.create,
  });

  factory PersonCreateOrConnectWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonCreateOrConnectWithoutEmployeesInputFromJson(json);

  final PersonWhereUniqueInput where;

  final PersonCreateWithoutEmployeesInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonCreateOrConnectWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUpsertWithoutEmployeesInput implements _i1.JsonSerializable {
  const DepartmentUpsertWithoutEmployeesInput({
    required this.update,
    required this.create,
  });

  factory DepartmentUpsertWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUpsertWithoutEmployeesInputFromJson(json);

  final DepartmentUpdateWithoutEmployeesInput update;

  final DepartmentCreateWithoutEmployeesInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUpsertWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUpdateWithoutEmployeesInput implements _i1.JsonSerializable {
  const DepartmentUpdateWithoutEmployeesInput({this.name});

  factory DepartmentUpdateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUpdateWithoutEmployeesInputFromJson(json);

  final StringFieldUpdateOperationsInput? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUpdateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class DepartmentUncheckedUpdateWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const DepartmentUncheckedUpdateWithoutEmployeesInput({
    this.id,
    this.name,
  });

  factory DepartmentUncheckedUpdateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentUncheckedUpdateWithoutEmployeesInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  @override
  Map<String, dynamic> toJson() =>
      _$DepartmentUncheckedUpdateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonUpsertWithoutEmployeesInput implements _i1.JsonSerializable {
  const PersonUpsertWithoutEmployeesInput({
    required this.update,
    required this.create,
  });

  factory PersonUpsertWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonUpsertWithoutEmployeesInputFromJson(json);

  final PersonUpdateWithoutEmployeesInput update;

  final PersonCreateWithoutEmployeesInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonUpsertWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonUpdateWithoutEmployeesInput implements _i1.JsonSerializable {
  const PersonUpdateWithoutEmployeesInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonUpdateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonUpdateWithoutEmployeesInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final StringFieldUpdateOperationsInput? address;

  final DateTimeFieldUpdateOperationsInput? birthDate;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonUpdateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class PersonUncheckedUpdateWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const PersonUncheckedUpdateWithoutEmployeesInput({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonUncheckedUpdateWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PersonUncheckedUpdateWithoutEmployeesInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? name;

  final StringFieldUpdateOperationsInput? address;

  final DateTimeFieldUpdateOperationsInput? birthDate;

  @override
  Map<String, dynamic> toJson() =>
      _$PersonUncheckedUpdateWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateWithoutDepartmentInput implements _i1.JsonSerializable {
  const EmployeeUpdateWithoutDepartmentInput({
    this.id,
    this.position,
    this.person,
  });

  factory EmployeeUpdateWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateWithoutDepartmentInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? position;

  final PersonUpdateOneRequiredWithoutEmployeesNestedInput? person;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateWithoutDepartmentInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateWithoutDepartmentInput({
    this.id,
    this.personId,
    this.position,
  });

  factory EmployeeUncheckedUpdateWithoutDepartmentInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateWithoutDepartmentInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? personId;

  final IntFieldUpdateOperationsInput? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedUpdateWithoutDepartmentInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateManyWithoutEmployeesInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateManyWithoutEmployeesInput({
    this.id,
    this.personId,
    this.position,
  });

  factory EmployeeUncheckedUpdateManyWithoutEmployeesInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateManyWithoutEmployeesInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? personId;

  final IntFieldUpdateOperationsInput? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedUpdateManyWithoutEmployeesInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUpdateWithoutPersonInput implements _i1.JsonSerializable {
  const EmployeeUpdateWithoutPersonInput({
    this.id,
    this.position,
    this.department,
  });

  factory EmployeeUpdateWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUpdateWithoutPersonInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? position;

  final DepartmentUpdateOneRequiredWithoutEmployeesNestedInput? department;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUpdateWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class EmployeeUncheckedUpdateWithoutPersonInput
    implements _i1.JsonSerializable {
  const EmployeeUncheckedUpdateWithoutPersonInput({
    this.id,
    this.departmentId,
    this.position,
  });

  factory EmployeeUncheckedUpdateWithoutPersonInput.fromJson(
          Map<String, dynamic> json) =>
      _$EmployeeUncheckedUpdateWithoutPersonInputFromJson(json);

  final StringFieldUpdateOperationsInput? id;

  final IntFieldUpdateOperationsInput? departmentId;

  final IntFieldUpdateOperationsInput? position;

  @override
  Map<String, dynamic> toJson() =>
      _$EmployeeUncheckedUpdateWithoutPersonInputToJson(this);
}

@_i1.jsonSerializable
class Department implements _i1.JsonSerializable {
  const Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  final int id;

  final String name;

  @override
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@_i1.jsonSerializable
class Person implements _i1.JsonSerializable {
  const Person({
    required this.id,
    required this.name,
    required this.address,
    required this.birthDate,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  final String id;

  final String name;

  final String address;

  final DateTime birthDate;

  @override
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@_i1.jsonSerializable
class Employee implements _i1.JsonSerializable {
  const Employee({
    required this.id,
    required this.departmentId,
    required this.personId,
    required this.position,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  final String id;

  final int departmentId;

  final String personId;

  final int position;

  @override
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

class DepartmentFluent<T> extends _i1.PrismaFluent<T> {
  const DepartmentFluent(
    super.original,
    super.$query,
  );

  Future<Iterable<Employee>?> employees({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithRelationInput>? orderBy,
    EmployeeWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<EmployeeScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'employees',
          fields: fields,
          args: args,
        )
      ]),
      key: r'employees',
    );
    final fields = EmployeeScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> employees) =>
        employees.map((Map employees) => Employee.fromJson(employees.cast()));
    return query(fields)
        .then((json) => json is Iterable ? compiler(json.cast()) : null);
  }

  DepartmentCountOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return DepartmentCountOutputType(query);
  }
}

class PersonFluent<T> extends _i1.PrismaFluent<T> {
  const PersonFluent(
    super.original,
    super.$query,
  );

  Future<Iterable<Employee>?> employees({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithRelationInput>? orderBy,
    EmployeeWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<EmployeeScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'employees',
          fields: fields,
          args: args,
        )
      ]),
      key: r'employees',
    );
    final fields = EmployeeScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> employees) =>
        employees.map((Map employees) => Employee.fromJson(employees.cast()));
    return query(fields)
        .then((json) => json is Iterable ? compiler(json.cast()) : null);
  }

  PersonCountOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return PersonCountOutputType(query);
  }
}

class EmployeeFluent<T> extends _i1.PrismaFluent<T> {
  const EmployeeFluent(
    super.original,
    super.$query,
  );

  DepartmentFluent<Department> department() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'department',
          fields: fields,
        )
      ]),
      key: r'department',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found TypeRefType.string(value: Department)'));
    return DepartmentFluent<Department>(
      future,
      query,
    );
  }

  PersonFluent<Person> person() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'person',
          fields: fields,
        )
      ]),
      key: r'person',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Person.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Person)'));
    return PersonFluent<Person>(
      future,
      query,
    );
  }
}

extension DepartmentModelDelegateExtension on _i1.ModelDelegate<Department> {
  DepartmentFluent<Department?> findUnique(
      {required DepartmentWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueDepartment',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : null);
    return DepartmentFluent<Department?>(
      future,
      query,
    );
  }

  DepartmentFluent<Department> findUniqueOrThrow(
      {required DepartmentWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueDepartmentOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueDepartmentOrThrow',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found TypeRefType.string(value: Department)'));
    return DepartmentFluent<Department>(
      future,
      query,
    );
  }

  DepartmentFluent<Department?> findFirst({
    DepartmentWhereInput? where,
    Iterable<DepartmentOrderByWithRelationInput>? orderBy,
    DepartmentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<DepartmentScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstDepartment',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : null);
    return DepartmentFluent<Department?>(
      future,
      query,
    );
  }

  DepartmentFluent<Department> findFirstOrThrow({
    DepartmentWhereInput? where,
    Iterable<DepartmentOrderByWithRelationInput>? orderBy,
    DepartmentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<DepartmentScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstDepartmentOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstDepartmentOrThrow',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found TypeRefType.string(value: Department)'));
    return DepartmentFluent<Department>(
      future,
      query,
    );
  }

  Future<Iterable<Department>> findMany({
    DepartmentWhereInput? where,
    Iterable<DepartmentOrderByWithRelationInput>? orderBy,
    DepartmentWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<DepartmentScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyDepartment',
    );
    final fields = DepartmentScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyDepartment) =>
        findManyDepartment.map((Map findManyDepartment) =>
            Department.fromJson(findManyDepartment.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  DepartmentFluent<Department> create({required DepartmentCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneDepartment',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found TypeRefType.string(value: Department)'));
    return DepartmentFluent<Department>(
      future,
      query,
    );
  }

  DepartmentFluent<Department?> update({
    required DepartmentUpdateInput data,
    required DepartmentWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneDepartment',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : null);
    return DepartmentFluent<Department?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required DepartmentUpdateManyMutationInput data,
    DepartmentWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyDepartment',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyDepartment) =>
        AffectedRowsOutput.fromJson(updateManyDepartment.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  DepartmentFluent<Department> upsert({
    required DepartmentWhereUniqueInput where,
    required DepartmentCreateInput create,
    required DepartmentUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneDepartment',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found TypeRefType.string(value: Department)'));
    return DepartmentFluent<Department>(
      future,
      query,
    );
  }

  DepartmentFluent<Department?> delete(
      {required DepartmentWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneDepartment',
    );
    final future = query(DepartmentScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? Department.fromJson(json.cast<String, dynamic>())
            : null);
    return DepartmentFluent<Department?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({DepartmentWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyDepartment',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyDepartment) =>
        AffectedRowsOutput.fromJson(deleteManyDepartment.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateDepartment aggregate({
    DepartmentWhereInput? where,
    Iterable<DepartmentOrderByWithRelationInput>? orderBy,
    DepartmentWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateDepartment',
    );
    return AggregateDepartment(query);
  }

  Future<Iterable<DepartmentGroupByOutputType>> groupBy({
    DepartmentWhereInput? where,
    Iterable<DepartmentOrderByWithAggregationInput>? orderBy,
    required Iterable<DepartmentScalarFieldEnum> by,
    DepartmentScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByDepartment',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByDepartment',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByDepartment) =>
        groupByDepartment.map((Map groupByDepartment) =>
            DepartmentGroupByOutputType.fromJson(groupByDepartment.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension PersonModelDelegateExtension on _i1.ModelDelegate<Person> {
  PersonFluent<Person?> findUnique({required PersonWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniquePerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniquePerson',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Person.fromJson(json.cast<String, dynamic>()) : null);
    return PersonFluent<Person?>(
      future,
      query,
    );
  }

  PersonFluent<Person> findUniqueOrThrow(
      {required PersonWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniquePersonOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniquePersonOrThrow',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Person.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Person)'));
    return PersonFluent<Person>(
      future,
      query,
    );
  }

  PersonFluent<Person?> findFirst({
    PersonWhereInput? where,
    Iterable<PersonOrderByWithRelationInput>? orderBy,
    PersonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<PersonScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstPerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstPerson',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Person.fromJson(json.cast<String, dynamic>()) : null);
    return PersonFluent<Person?>(
      future,
      query,
    );
  }

  PersonFluent<Person> findFirstOrThrow({
    PersonWhereInput? where,
    Iterable<PersonOrderByWithRelationInput>? orderBy,
    PersonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<PersonScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstPersonOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstPersonOrThrow',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Person.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Person)'));
    return PersonFluent<Person>(
      future,
      query,
    );
  }

  Future<Iterable<Person>> findMany({
    PersonWhereInput? where,
    Iterable<PersonOrderByWithRelationInput>? orderBy,
    PersonWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<PersonScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyPerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyPerson',
    );
    final fields = PersonScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyPerson) => findManyPerson
        .map((Map findManyPerson) => Person.fromJson(findManyPerson.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  PersonFluent<Person> create({required PersonCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOnePerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOnePerson',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Person.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Person)'));
    return PersonFluent<Person>(
      future,
      query,
    );
  }

  PersonFluent<Person?> update({
    required PersonUpdateInput data,
    required PersonWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOnePerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOnePerson',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Person.fromJson(json.cast<String, dynamic>()) : null);
    return PersonFluent<Person?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required PersonUpdateManyMutationInput data,
    PersonWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyPerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyPerson',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyPerson) =>
        AffectedRowsOutput.fromJson(updateManyPerson.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  PersonFluent<Person> upsert({
    required PersonWhereUniqueInput where,
    required PersonCreateInput create,
    required PersonUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOnePerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOnePerson',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Person.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Person)'));
    return PersonFluent<Person>(
      future,
      query,
    );
  }

  PersonFluent<Person?> delete({required PersonWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOnePerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOnePerson',
    );
    final future = query(PersonScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Person.fromJson(json.cast<String, dynamic>()) : null);
    return PersonFluent<Person?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({PersonWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyPerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyPerson',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyPerson) =>
        AffectedRowsOutput.fromJson(deleteManyPerson.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregatePerson aggregate({
    PersonWhereInput? where,
    Iterable<PersonOrderByWithRelationInput>? orderBy,
    PersonWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregatePerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregatePerson',
    );
    return AggregatePerson(query);
  }

  Future<Iterable<PersonGroupByOutputType>> groupBy({
    PersonWhereInput? where,
    Iterable<PersonOrderByWithAggregationInput>? orderBy,
    required Iterable<PersonScalarFieldEnum> by,
    PersonScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByPerson',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByPerson',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByPerson) =>
        groupByPerson.map((Map groupByPerson) =>
            PersonGroupByOutputType.fromJson(groupByPerson.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension EmployeeModelDelegateExtension on _i1.ModelDelegate<Employee> {
  EmployeeFluent<Employee?> findUnique(
      {required EmployeeWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueEmployee',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : null);
    return EmployeeFluent<Employee?>(
      future,
      query,
    );
  }

  EmployeeFluent<Employee> findUniqueOrThrow(
      {required EmployeeWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueEmployeeOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueEmployeeOrThrow',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Employee)'));
    return EmployeeFluent<Employee>(
      future,
      query,
    );
  }

  EmployeeFluent<Employee?> findFirst({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithRelationInput>? orderBy,
    EmployeeWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<EmployeeScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstEmployee',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : null);
    return EmployeeFluent<Employee?>(
      future,
      query,
    );
  }

  EmployeeFluent<Employee> findFirstOrThrow({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithRelationInput>? orderBy,
    EmployeeWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<EmployeeScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstEmployeeOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstEmployeeOrThrow',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Employee)'));
    return EmployeeFluent<Employee>(
      future,
      query,
    );
  }

  Future<Iterable<Employee>> findMany({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithRelationInput>? orderBy,
    EmployeeWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<EmployeeScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyEmployee',
    );
    final fields = EmployeeScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyEmployee) => findManyEmployee.map(
        (Map findManyEmployee) => Employee.fromJson(findManyEmployee.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  EmployeeFluent<Employee> create({required EmployeeCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneEmployee',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Employee)'));
    return EmployeeFluent<Employee>(
      future,
      query,
    );
  }

  EmployeeFluent<Employee?> update({
    required EmployeeUpdateInput data,
    required EmployeeWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneEmployee',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : null);
    return EmployeeFluent<Employee?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required EmployeeUpdateManyMutationInput data,
    EmployeeWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyEmployee',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyEmployee) =>
        AffectedRowsOutput.fromJson(updateManyEmployee.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  EmployeeFluent<Employee> upsert({
    required EmployeeWhereUniqueInput where,
    required EmployeeCreateInput create,
    required EmployeeUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneEmployee',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : throw Exception('Not found TypeRefType.string(value: Employee)'));
    return EmployeeFluent<Employee>(
      future,
      query,
    );
  }

  EmployeeFluent<Employee?> delete({required EmployeeWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneEmployee',
    );
    final future = query(EmployeeScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Employee.fromJson(json.cast<String, dynamic>())
            : null);
    return EmployeeFluent<Employee?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({EmployeeWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyEmployee',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyEmployee) =>
        AffectedRowsOutput.fromJson(deleteManyEmployee.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateEmployee aggregate({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithRelationInput>? orderBy,
    EmployeeWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateEmployee',
    );
    return AggregateEmployee(query);
  }

  Future<Iterable<EmployeeGroupByOutputType>> groupBy({
    EmployeeWhereInput? where,
    Iterable<EmployeeOrderByWithAggregationInput>? orderBy,
    required Iterable<EmployeeScalarFieldEnum> by,
    EmployeeScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByEmployee',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByEmployee',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByEmployee) =>
        groupByEmployee.map((Map groupByEmployee) =>
            EmployeeGroupByOutputType.fromJson(groupByEmployee.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

@_i1.jsonSerializable
class DepartmentGroupByOutputType implements _i1.JsonSerializable {
  const DepartmentGroupByOutputType({
    this.id,
    this.name,
  });

  factory DepartmentGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$DepartmentGroupByOutputTypeFromJson(json);

  final int? id;

  final String? name;

  @override
  Map<String, dynamic> toJson() => _$DepartmentGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class PersonGroupByOutputType implements _i1.JsonSerializable {
  const PersonGroupByOutputType({
    this.id,
    this.name,
    this.address,
    this.birthDate,
  });

  factory PersonGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$PersonGroupByOutputTypeFromJson(json);

  final String? id;

  final String? name;

  final String? address;

  final DateTime? birthDate;

  @override
  Map<String, dynamic> toJson() => _$PersonGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class EmployeeGroupByOutputType implements _i1.JsonSerializable {
  const EmployeeGroupByOutputType({
    this.id,
    this.departmentId,
    this.personId,
    this.position,
  });

  factory EmployeeGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$EmployeeGroupByOutputTypeFromJson(json);

  final String? id;

  final int? departmentId;

  final String? personId;

  final int? position;

  @override
  Map<String, dynamic> toJson() => _$EmployeeGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class AffectedRowsOutput implements _i1.JsonSerializable {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map<String, dynamic> json) =>
      _$AffectedRowsOutputFromJson(json);

  final int? count;

  @override
  Map<String, dynamic> toJson() => _$AffectedRowsOutputToJson(this);
}

class AggregateDepartment {
  const AggregateDepartment(this.$query);

  final _i1.PrismaFluentQuery $query;

  DepartmentCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return DepartmentCountAggregateOutputType(query);
  }

  DepartmentAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return DepartmentAvgAggregateOutputType(query);
  }

  DepartmentSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return DepartmentSumAggregateOutputType(query);
  }

  DepartmentMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return DepartmentMinAggregateOutputType(query);
  }

  DepartmentMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return DepartmentMaxAggregateOutputType(query);
  }
}

class AggregatePerson {
  const AggregatePerson(this.$query);

  final _i1.PrismaFluentQuery $query;

  PersonCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return PersonCountAggregateOutputType(query);
  }

  PersonMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return PersonMinAggregateOutputType(query);
  }

  PersonMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return PersonMaxAggregateOutputType(query);
  }
}

class AggregateEmployee {
  const AggregateEmployee(this.$query);

  final _i1.PrismaFluentQuery $query;

  EmployeeCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return EmployeeCountAggregateOutputType(query);
  }

  EmployeeAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return EmployeeAvgAggregateOutputType(query);
  }

  EmployeeSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return EmployeeSumAggregateOutputType(query);
  }

  EmployeeMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return EmployeeMinAggregateOutputType(query);
  }

  EmployeeMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return EmployeeMaxAggregateOutputType(query);
  }
}

class DepartmentCountOutputType {
  const DepartmentCountOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> employees() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'employees',
          fields: fields,
        )
      ]),
      key: r'employees',
    );
    return query(const []).then((value) => (value as int));
  }
}

class DepartmentCountAggregateOutputType {
  const DepartmentCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> name() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'name',
          fields: fields,
        )
      ]),
      key: r'name',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class DepartmentAvgAggregateOutputType {
  const DepartmentAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class DepartmentSumAggregateOutputType {
  const DepartmentSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class DepartmentMinAggregateOutputType {
  const DepartmentMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> name() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'name',
          fields: fields,
        )
      ]),
      key: r'name',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class DepartmentMaxAggregateOutputType {
  const DepartmentMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> name() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'name',
          fields: fields,
        )
      ]),
      key: r'name',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class PersonCountOutputType {
  const PersonCountOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> employees() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'employees',
          fields: fields,
        )
      ]),
      key: r'employees',
    );
    return query(const []).then((value) => (value as int));
  }
}

class PersonCountAggregateOutputType {
  const PersonCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> name() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'name',
          fields: fields,
        )
      ]),
      key: r'name',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> address() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'address',
          fields: fields,
        )
      ]),
      key: r'address',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> birthDate() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'birthDate',
          fields: fields,
        )
      ]),
      key: r'birthDate',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class PersonMinAggregateOutputType {
  const PersonMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<String?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> name() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'name',
          fields: fields,
        )
      ]),
      key: r'name',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> address() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'address',
          fields: fields,
        )
      ]),
      key: r'address',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<DateTime?> birthDate() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'birthDate',
          fields: fields,
        )
      ]),
      key: r'birthDate',
    );
    return query(const [])
        .then((value) => value is String ? DateTime.parse(value) : null);
  }
}

class PersonMaxAggregateOutputType {
  const PersonMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<String?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> name() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'name',
          fields: fields,
        )
      ]),
      key: r'name',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> address() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'address',
          fields: fields,
        )
      ]),
      key: r'address',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<DateTime?> birthDate() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'birthDate',
          fields: fields,
        )
      ]),
      key: r'birthDate',
    );
    return query(const [])
        .then((value) => value is String ? DateTime.parse(value) : null);
  }
}

class EmployeeCountAggregateOutputType {
  const EmployeeCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> departmentId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'departmentId',
          fields: fields,
        )
      ]),
      key: r'departmentId',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> personId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'personId',
          fields: fields,
        )
      ]),
      key: r'personId',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> position() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'position',
          fields: fields,
        )
      ]),
      key: r'position',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class EmployeeAvgAggregateOutputType {
  const EmployeeAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> departmentId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'departmentId',
          fields: fields,
        )
      ]),
      key: r'departmentId',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> position() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'position',
          fields: fields,
        )
      ]),
      key: r'position',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class EmployeeSumAggregateOutputType {
  const EmployeeSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> departmentId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'departmentId',
          fields: fields,
        )
      ]),
      key: r'departmentId',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> position() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'position',
          fields: fields,
        )
      ]),
      key: r'position',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class EmployeeMinAggregateOutputType {
  const EmployeeMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<String?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> departmentId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'departmentId',
          fields: fields,
        )
      ]),
      key: r'departmentId',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> personId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'personId',
          fields: fields,
        )
      ]),
      key: r'personId',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> position() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'position',
          fields: fields,
        )
      ]),
      key: r'position',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class EmployeeMaxAggregateOutputType {
  const EmployeeMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<String?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> departmentId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'departmentId',
          fields: fields,
        )
      ]),
      key: r'departmentId',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> personId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'personId',
          fields: fields,
        )
      ]),
      key: r'personId',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> position() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'position',
          fields: fields,
        )
      ]),
      key: r'position',
    );
    return query(const []).then((value) => (value as int?));
  }
}

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class Datasources implements _i1.JsonSerializable {
  const Datasources({this.db = r'file:../bd.db'});

  final String? db;

  @override
  Map<String, dynamic> toJson() => _$DatasourcesToJson(this);
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient._internal(
    _i3.Engine engine, {
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  })  : _engine = engine,
        _headers = headers,
        _transaction = transaction,
        super(
          engine,
          headers: headers,
          transaction: transaction,
        );

  factory PrismaClient({
    Datasources? datasources,
    Iterable<_i4.Event>? stdout,
    Iterable<_i4.Event>? event,
  }) {
    final logger = _i4.Logger(
      stdout: stdout,
      event: event,
    );
    final engine = _i5.BinaryEngine(
      logger: logger,
      schema:
          r'Ly8gVGhpcyBpcyB5b3VyIFByaXNtYSBzY2hlbWEgZmlsZSwKLy8gbGVhcm4gbW9yZSBhYm91dCBpdCBpbiB0aGUgZG9jczogaHR0cHM6Ly9wcmlzLmx5L2QvcHJpc21hLXNjaGVtYQoKZ2VuZXJhdG9yIGNsaWVudCB7CiAgcHJvdmlkZXIgPSAiZGFydCBydW4gb3JtIgp9CgpkYXRhc291cmNlIGRiIHsKICBwcm92aWRlciA9ICJzcWxpdGUiCiAgdXJsICAgICAgPSAiZmlsZTouLi9iZC5kYiIKfQoKbW9kZWwgRGVwYXJ0bWVudCB7CiAgaWQgICAgICAgIEludCAgICAgICAgQGlkIEBkZWZhdWx0KGF1dG9pbmNyZW1lbnQoKSkKICBuYW1lICAgICAgU3RyaW5nCiAgZW1wbG95ZWVzIEVtcGxveWVlW10KCiAgQEBtYXAoImRlcGFydG1lbnRzIikKfQoKbW9kZWwgUGVyc29uIHsKICBpZCAgICAgICAgU3RyaW5nICAgICBAaWQgQGRlZmF1bHQodXVpZCgpKQogIG5hbWUgICAgICBTdHJpbmcKICBhZGRyZXNzICAgU3RyaW5nCiAgYmlydGhEYXRlIERhdGVUaW1lICAgQG1hcCgiYmlydGhfZGF0ZSIpCiAgZW1wbG95ZWVzIEVtcGxveWVlW10KCiAgQEBtYXAoInBlb3BsZSIpCn0KCm1vZGVsIEVtcGxveWVlIHsKICBpZCAgICAgICAgICAgU3RyaW5nICAgICBAaWQgQGRlZmF1bHQodXVpZCgpKQogIGRlcGFydG1lbnQgICBEZXBhcnRtZW50IEByZWxhdGlvbihmaWVsZHM6IFtkZXBhcnRtZW50SWRdLCByZWZlcmVuY2VzOiBbaWRdLCBvbkRlbGV0ZTogQ2FzY2FkZSkKICBkZXBhcnRtZW50SWQgSW50ICAgICAgICBAbWFwKCJkZXBhcnRtZW50X2lkIikKICBwZXJzb24gICAgICAgUGVyc29uICAgICBAcmVsYXRpb24oZmllbGRzOiBbcGVyc29uSWRdLCByZWZlcmVuY2VzOiBbaWRdLCBvbkRlbGV0ZTogQ2FzY2FkZSkKICBwZXJzb25JZCAgICAgU3RyaW5nICAgICBAbWFwKCJwZXJzb25faWQiKQogIHBvc2l0aW9uICAgICBJbnQKCiAgQEBtYXAoImVtcGxveWVlcyIpCn0K',
      datasources: datasources?.toJson().cast() ?? const {},
      executable:
          r'/workspaces/database/Dart/orm/node_modules/prisma/query-engine-debian-openssl-1.1.x',
    );
    return PrismaClient._internal(engine);
  }

  final _i3.Engine _engine;

  final _i3.QueryEngineRequestHeaders? _headers;

  final _i3.TransactionInfo? _transaction;

  @override
  PrismaClient copyWith({
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  }) =>
      PrismaClient._internal(
        _engine,
        headers: headers ?? _headers,
        transaction: transaction ?? _transaction,
      );
  _i1.ModelDelegate<Department> get department => _i1.ModelDelegate<Department>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<Person> get person => _i1.ModelDelegate<Person>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<Employee> get employee => _i1.ModelDelegate<Employee>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
}
