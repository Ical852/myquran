part of '../cubits/current_read_cubit.dart';

sealed class CurrentReadState extends Equatable {
  const CurrentReadState();

  @override
  List<Object> get props => [];
}

final class CurrentReadInitial extends CurrentReadState {}
