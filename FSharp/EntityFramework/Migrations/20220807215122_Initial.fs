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
[<Migration("20220807215122_Initial")>]
type Initial() =
    inherit Migration()

    override this.Up(migrationBuilder:MigrationBuilder) =
        migrationBuilder.CreateTable(
            name = "Departments"
            ,columns = (fun table -> 
            {|
                Id =
                    table.Column<int>(
                        nullable = false
                        ,``type`` = "INTEGER"
                    ).Annotation("Sqlite:Autoincrement", true)
                Name =
                    table.Column<string>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
            |})
            , constraints =
                (fun table -> 
                    table.PrimaryKey("PK_Departments", (fun x -> (x.Id) :> obj)
                    ) |> ignore
                )
        ) |> ignore

        migrationBuilder.CreateTable(
            name = "People"
            ,columns = (fun table -> 
            {|
                Id =
                    table.Column<Guid>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
                Name =
                    table.Column<string>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
                Address =
                    table.Column<string>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
                BirthDate =
                    table.Column<DateOnly>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
            |})
            , constraints =
                (fun table -> 
                    table.PrimaryKey("PK_People", (fun x -> (x.Id) :> obj)
                    ) |> ignore
                )
        ) |> ignore

        migrationBuilder.CreateTable(
            name = "Employees"
            ,columns = (fun table -> 
            {|
                Id =
                    table.Column<Guid>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
                PersonId =
                    table.Column<Guid>(
                        nullable = false
                        ,``type`` = "TEXT"
                    )
                DepartmentId =
                    table.Column<int>(
                        nullable = false
                        ,``type`` = "INTEGER"
                    )
                Position =
                    table.Column<int>(
                        nullable = false
                        ,``type`` = "INTEGER"
                    )
            |})
            , constraints =
                (fun table -> 
                    table.PrimaryKey("PK_Employees", (fun x -> (x.Id) :> obj)
                    ) |> ignore
                    table.ForeignKey(
                        name = "FK_Employees_Departments_DepartmentId"
                        ,column = (fun x -> (x.DepartmentId) :> obj)
                        ,principalTable = "Departments"
                        ,principalColumn = "Id"
                        ,onDelete = ReferentialAction.Cascade
                        ) |> ignore

                    table.ForeignKey(
                        name = "FK_Employees_People_PersonId"
                        ,column = (fun x -> (x.PersonId) :> obj)
                        ,principalTable = "People"
                        ,principalColumn = "Id"
                        ,onDelete = ReferentialAction.Cascade
                        ) |> ignore

                )
        ) |> ignore

        migrationBuilder.CreateIndex(
            name = "IX_Employees_DepartmentId"
            ,table = "Employees"
            ,column = "DepartmentId"
            ) |> ignore

        migrationBuilder.CreateIndex(
            name = "IX_Employees_PersonId"
            ,table = "Employees"
            ,column = "PersonId"
            ) |> ignore


    override this.Down(migrationBuilder:MigrationBuilder) =
        migrationBuilder.DropTable(
            name = "Employees"
            ) |> ignore

        migrationBuilder.DropTable(
            name = "Departments"
            ) |> ignore

        migrationBuilder.DropTable(
            name = "People"
            ) |> ignore


    override this.BuildTargetModel(modelBuilder: ModelBuilder) =
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

