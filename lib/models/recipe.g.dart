// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 1;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      title: fields[0] as String,
      imgURL: fields[1] as String,
      calories: fields[2] as double,
      totalTime: fields[3] as double,
      dishtype: (fields[4] as List).cast<dynamic>(),
      cuisineType: (fields[5] as List).cast<dynamic>(),
      mealType: (fields[6] as List).cast<dynamic>(),
      ingredientLines: (fields[7] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imgURL)
      ..writeByte(2)
      ..write(obj.calories)
      ..writeByte(3)
      ..write(obj.totalTime)
      ..writeByte(4)
      ..write(obj.dishtype)
      ..writeByte(5)
      ..write(obj.cuisineType)
      ..writeByte(6)
      ..write(obj.mealType)
      ..writeByte(7)
      ..write(obj.ingredientLines);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
