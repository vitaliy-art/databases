﻿// <auto-generated />
namespace EntityFramework.Migrations

open System
open Context
open Microsoft.EntityFrameworkCore
open Microsoft.EntityFrameworkCore.Infrastructure
open Microsoft.EntityFrameworkCore.Metadata
open Microsoft.EntityFrameworkCore.Migrations
open Microsoft.EntityFrameworkCore.Storage.ValueConversion

[<DbContext(typeof<ApplicationContext>)>]
type ApplicationContextModelSnapshot() =
    inherit ModelSnapshot()

    override this.BuildModel(modelBuilder: ModelBuilder) =
        modelBuilder.HasAnnotation("ProductVersion", "6.0.7") |> ignore

        modelBuilder.Entity("Models.Department", (fun b ->

            b.Property<int>("Id")
                .IsRequired(true)
                .ValueGeneratedOnAdd()
                .HasColumnType("INTEGER")
                |> ignore

            b.Property<string>("Name")
                .IsRequired(true)
                .HasColumnType("TEXT")
                |> ignore

            b.HasKey("Id")
                |> ignore


            b.ToTable("Departments") |> ignore

        )) |> ignore

        modelBuilder.Entity("Models.Employee", (fun b ->

            b.Property<Guid>("Id")
                .IsRequired(true)
                .ValueGeneratedOnAdd()
                .HasColumnType("TEXT")
                |> ignore

            b.Property<int>("DepartmentId")
                .IsRequired(true)
                .HasColumnType("INTEGER")
                |> ignore

            b.Property<Guid>("PersonId")
                .IsRequired(true)
                .HasColumnType("TEXT")
                |> ignore

            b.Property<int>("Position")
                .IsRequired(true)
                .HasColumnType("INTEGER")
                |> ignore

            b.HasKey("Id")
                |> ignore


            b.HasIndex("DepartmentId")
                |> ignore


            b.HasIndex("PersonId")
                |> ignore

            b.ToTable("Employees") |> ignore

        )) |> ignore

        modelBuilder.Entity("Models.Person", (fun b ->

            b.Property<Guid>("Id")
                .IsRequired(true)
                .ValueGeneratedOnAdd()
                .HasColumnType("TEXT")
                |> ignore

            b.Property<string>("Address")
                .IsRequired(true)
                .HasColumnType("TEXT")
                |> ignore

            b.Property<DateOnly>("BirthDate")
                .IsRequired(true)
                .HasColumnType("TEXT")
                |> ignore

            b.Property<string>("Name")
                .IsRequired(true)
                .HasColumnType("TEXT")
                |> ignore

            b.HasKey("Id")
                |> ignore


            b.ToTable("People") |> ignore

        )) |> ignore
        modelBuilder.Entity("Models.Employee", (fun b ->
            b.HasOne("Models.Department", "Department")
                .WithMany()
                .HasForeignKey("DepartmentId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired()
                |> ignore
            b.HasOne("Models.Person", "Person")
                .WithMany()
                .HasForeignKey("PersonId")
                .OnDelete(DeleteBehavior.Cascade)
                .IsRequired()
                |> ignore

        )) |> ignore

