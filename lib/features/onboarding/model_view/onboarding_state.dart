part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}
class ChangeCurrentIndexState extends OnboardingState {}
class MoveNextPageState extends OnboardingState {}
