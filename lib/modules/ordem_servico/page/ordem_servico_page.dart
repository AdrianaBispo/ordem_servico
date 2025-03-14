import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import '../../../theme/app_color.dart';
import '../../../theme/app_textstyle.dart';
import '../data/dtos/ordem_servico_dto.dart';
import 'bloc/ordem_servico_cubit.dart';
import 'bloc/ordem_servico_state.dart';

class OrdemServicoPage extends StatefulWidget {
  const OrdemServicoPage({super.key});

  @override
  _OrdemServicoPageState createState() => _OrdemServicoPageState();
}

class _OrdemServicoPageState extends State<OrdemServicoPage> {
  final cubit = Modular.get<OrdemServicoCubit>();

  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final List<String> _checklistItems = [
    'Cliente foi informado sobre o início do serviço',
    'Equipamento ou local inspecionado antes da manutenção',
    'Identificação de peças ou componentes danificados',
    'Registro de fotos do estado inicial'
  ];
  List<bool> _checklistValues = [];
  File? _image;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _checklistValues.addAll(List.filled(_checklistItems.length, false));
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Manutenção de OS',
        style: AppTextStyle.instance.appBar,
      )),
      body: BlocConsumer<OrdemServicoCubit, OrdemServicoState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          } else if (state.ordemServico != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Ordem de serviço salva com sucesso!')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _checklistItems.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(_checklistItems[index],
                            style: AppTextStyle.instance.textInputTitle),
                        value: _checklistValues[index],
                        onChanged: (value) {
                          setState(() {
                            _checklistValues[index] = value!;
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Descrição das atividades',
                          style: AppTextStyle.instance.textInputTitle,
                        ),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Insira uma descrição';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: Text(
                      'Tirar foto',
                      style: AppTextStyle.instance.textButton,
                    ),
                  ),
                  if (_image != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(_image!),
                    ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.saveOrdemServico(
                          OrdemServicoDto(
                            clienteInformado: _checklistValues[0],
                            equipamentoInspecionado: _checklistValues[1],
                            pecasIdentificadas: _checklistValues[2],
                            fotosEstadoInicial: _checklistValues[3],
                            descricao: _descriptionController.text,
                            imagePath: _image?.path ?? '',
                          ),
                        );
                        _descriptionController.clear();
                        setState(() {
                          _checklistValues = List.generate(
                            _checklistItems.length,
                            (index) => false,
                          );
                          _image = null;
                        });
                      }
                    },
                    child: Text(
                      'Salvar',
                      style: AppTextStyle.instance.textButton,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state.isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColor.instance.primary,
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
