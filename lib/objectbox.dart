import 'package:flutter/material.dart';
import 'package:my_flutter_cookbook/model/models.dart';
import 'package:my_flutter_cookbook/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBox {
  late final Store store;

  late final Box<Task> taskBox;
  late final Box<Owner> ownerBox;

  ObjectBox._create(this.store) {
    taskBox = Box<Task>(store);
    ownerBox = Box<Owner>(store);

    if (taskBox.isEmpty()) {
      _putDemoData();
    }
  }

  void _putDemoData() {
    Owner owner1 = Owner('Eren');
    Owner owner2 = Owner('Mikasa');

    Task task1 = Task('Kill Humans');
    task1.owner.target = owner1;

    Task task2 = Task('Kill Titans');
    task2.owner.target = owner2;

    taskBox.putMany([task1, task2]);
  }

  //create an instance of the store
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

//will be used to get add task into store
  void addTask(String taskText, Owner owner) {
    Task newTask = Task(taskText);
    newTask.owner.target = owner;

    taskBox.put(newTask);

    debugPrint(
        "Added Task: ${newTask.text} assigned to ${newTask.owner.target?.name}");
  }

//will be used to add owner into store
  int addOwner(String newOwner) {
    Owner ownerToAdd = Owner(newOwner);
    int newObjectId = ownerBox.put(ownerToAdd);

    return newObjectId;
  }

//will be used to query all the tasks in the store(ordered by ID)
  Stream<List<Task>> getTasks() {
    final builder = taskBox.query()..order(Task_.id, flags: Order.descending);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
