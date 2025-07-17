<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Cache\Adapter\AdapterInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Contracts\Cache\CacheInterface;
use Symfony\Contracts\Cache\ItemInterface;

final class UserController extends AbstractController
{
    #[Route('/user', name: 'user_index')]
    public function index(EntityManagerInterface $entityManager): Response
    {

        $u = $entityManager->getRepository(User::class)->find(1);

        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

    #[Route('api/me', name: 'user_me')]
    #[IsGranted("ROLE_USER")]
    public function me() 
    {
        return $this->json($this->getUser());
    }
}
