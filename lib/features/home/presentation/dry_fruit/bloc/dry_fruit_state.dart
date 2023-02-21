part of 'dry_fruit_bloc.dart';

class DryFruitState extends Equatable {
  final CollectionModel indehiscentCollection;
  final RequestState indehiscentState;
  final String indehiscentErrorMessage;
  final CollectionModel dehiscentCollection;
  final RequestState dehiscentState;
  final String dehiscentErrorMessage;
  final CollectionModel mixedDryFruitCollection;
  final RequestState mixedDryFruitState;
  final String mixedDryFruitErrorMessage;
  final CollectionModel kashmiriDryFruitCollection;
  final RequestState kashmiriDryFruitState;
  final String kashmiriDryFruitErrorMessage;

  const DryFruitState({
    this.indehiscentCollection = const CollectionModel(),
    this.indehiscentState = RequestState.loading,
    this.indehiscentErrorMessage = '',
    this.dehiscentCollection = const CollectionModel(),
    this.dehiscentState = RequestState.loading,
    this.dehiscentErrorMessage = '',
    this.mixedDryFruitCollection = const CollectionModel(),
    this.mixedDryFruitState = RequestState.loading,
    this.mixedDryFruitErrorMessage = '',
    this.kashmiriDryFruitCollection = const CollectionModel(),
    this.kashmiriDryFruitState = RequestState.loading,
    this.kashmiriDryFruitErrorMessage = '',
  });
  DryFruitState copyWith({
    CollectionModel? indehiscentCollection,
    RequestState? indehiscentState,
    String? indehiscentErrorMessage,
    CollectionModel? dehiscentCollection,
    RequestState? dehiscentState,
    String? dehiscentErrorMessage,
    CollectionModel? mixedDryFruitCollection,
    RequestState? mixedDryFruitState,
    String? mixedDryFruitErrorMessage,
    CollectionModel? kashmiriDryFruitCollection,
    RequestState? kashmiriDryFruitState,
    String? kashmiriDryFruitErrorMessage,
  }) {
    return DryFruitState(
      indehiscentCollection:
          indehiscentCollection ?? this.indehiscentCollection,
      indehiscentState: indehiscentState ?? this.indehiscentState,
      indehiscentErrorMessage:
          indehiscentErrorMessage ?? this.indehiscentErrorMessage,
      dehiscentCollection: dehiscentCollection ?? this.dehiscentCollection,
      dehiscentState: dehiscentState ?? this.dehiscentState,
      dehiscentErrorMessage:
          dehiscentErrorMessage ?? this.dehiscentErrorMessage,
      mixedDryFruitCollection:
          mixedDryFruitCollection ?? this.mixedDryFruitCollection,
      mixedDryFruitState: mixedDryFruitState ?? this.mixedDryFruitState,
      mixedDryFruitErrorMessage:
          mixedDryFruitErrorMessage ?? this.mixedDryFruitErrorMessage,
      kashmiriDryFruitCollection:
          kashmiriDryFruitCollection ?? this.kashmiriDryFruitCollection,
      kashmiriDryFruitState:
          kashmiriDryFruitState ?? this.kashmiriDryFruitState,
      kashmiriDryFruitErrorMessage:
          kashmiriDryFruitErrorMessage ?? this.kashmiriDryFruitErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        indehiscentCollection,
        indehiscentErrorMessage,
        indehiscentState,
        dehiscentCollection,
        dehiscentErrorMessage,
        dehiscentState,
        kashmiriDryFruitCollection,
        kashmiriDryFruitState,
        kashmiriDryFruitErrorMessage,
        mixedDryFruitCollection,
        mixedDryFruitState,
        mixedDryFruitErrorMessage
      ];
}
