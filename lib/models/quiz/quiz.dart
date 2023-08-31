// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
    final bool success;
    final String message;
    final Data data;

    Quiz({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    final QuizClass quiz;

    Data({
        required this.quiz,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        quiz: QuizClass.fromJson(json["quiz"]),
    );

    Map<String, dynamic> toJson() => {
        "quiz": quiz.toJson(),
    };
}

class QuizClass {
    final Options options;
    final String id;
    final int qId;
    final String question;
    final int v;

    QuizClass({
        required this.options,
        required this.id,
        required this.qId,
        required this.question,
        required this.v,
    });

    factory QuizClass.fromJson(Map<String, dynamic> json) => QuizClass(
        options: Options.fromJson(json["options"]),
        id: json["_id"],
        qId: json["qId"],
        question: json["question"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "options": options.toJson(),
        "_id": id,
        "qId": qId,
        "question": question,
        "__v": v,
    };
}

class Options {
    final String a;
    final String b;
    final String c;
    final String d;

    Options({
        required this.a,
        required this.b,
        required this.c,
        required this.d,
    });

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "b": b,
        "c": c,
        "d": d,
    };
}
