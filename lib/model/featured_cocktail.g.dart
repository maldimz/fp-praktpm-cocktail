// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_cocktail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeaturedCocktailAdapter extends TypeAdapter<FeaturedCocktail> {
  @override
  final int typeId = 0;

  @override
  FeaturedCocktail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeaturedCocktail(
      ingredients: (fields[0] as List).cast<String>(),
      instructions: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FeaturedCocktail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ingredients)
      ..writeByte(1)
      ..write(obj.instructions)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeaturedCocktailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
